# frozen_string_literal: true

class ContactMailController < ApplicationController
  # Local MVP: 3 requests/15 min/IP in one Rails process. Production requires
  # persistent distributed rate limits, captcha and attachment malware scanning.
  RATE_STORE = ActiveSupport::Cache::MemoryStore.new(size: 1.megabyte)
  MAX_FILES = 2
  MAX_TOTAL_BYTES = 8.megabytes
  ALLOWED = {
    '.pdf' => 'application/pdf', '.jpg' => 'image/jpeg',
    '.jpeg' => 'image/jpeg', '.png' => 'image/png',
    '.txt' => 'text/plain',
    '.docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    '.xlsx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  }.freeze

  def new
    show_form
  end

  def create
    @values = {
      name: params[:sender_name].to_s.strip,
      email: params[:sender_email].to_s.strip,
      subject: params[:subject_text].to_s.strip,
      body: params[:body_text].to_s.strip
    }
    @errors = []
    @sent = false
    uploads = Array(params[:attachments]).reject(&:blank?)

    @errors << 'Укажите имя (до 100 символов).' if @values[:name].empty? || @values[:name].length > 100
    @errors << 'Укажите действительный email.' unless @values[:email].match?(/\A[A-Za-z0-9.!#$%&'*+\/?^_`{|}~-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/) && @values[:email].length <= 254
    @errors << 'Укажите тему (до 150 символов).' if @values[:subject].empty? || @values[:subject].length > 150
    @errors << 'Сообщение должно содержать от 20 до 4000 символов.' unless (20..4000).cover?(@values[:body].length)
    @errors << 'Слишком много вложений (максимум два).' if uploads.length > MAX_FILES
    total_size = 0
    uploads.each do |file|
      unless file.respond_to?(:original_filename) && file.respond_to?(:size)
        @errors << 'Неверный формат вложения.'
        next
      end
      extension = File.extname(file.original_filename.to_s).downcase
      unless ALLOWED[extension] == file.content_type
        @errors << 'Разрешены PDF, JPG, PNG, TXT, DOCX, XLSX.'
      end
      total_size += file.size.to_i
    end
    @errors << 'Общий размер вложений не должен превышать 8 МБ.' if total_size > MAX_TOTAL_BYTES
    @errors << 'Не удалось подтвердить форму.' if params[:website].present? # honeypot
    @errors << 'Почта ещё не настроена на сервере.' if ENV['CAREER_GMAIL_APP_PASSWORD'].to_s.empty?

    if @errors.empty?
      key = "contact_mail:#{request.remote_ip}"
      attempts = RATE_STORE.read(key).to_i
      if attempts >= 3
        @errors << 'Слишком много попыток. Повторите позже.'
      else
        RATE_STORE.write(key, attempts + 1, expires_in: 15.minutes)
        ClientContactMailer.contact_message(
          sender_name: @values[:name], sender_email: @values[:email],
          subject_text: @values[:subject], body_text: @values[:body], uploads: uploads
        ).deliver_now
        @sent = true
        @values = {}
      end
    end
    show_form
  rescue StandardError => error
    Rails.logger.warn("Contact form delivery failed: #{error.class}")
    @errors = ['Письмо не отправлено. Повторите позже или свяжитесь через мессенджер.']
    @sent = false
    show_form
  end

  private

  def show_form
    render turbo_stream: turbo_stream.replace('experience', partial: 'contact_mail/form',
      locals: { values: @values || {}, errors: @errors || [], sent: @sent || false })
  end
end
