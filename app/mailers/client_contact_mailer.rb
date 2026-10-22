# frozen_string_literal: true

class ClientContactMailer < ApplicationMailer
  OWNER_EMAIL = '7495500@gmail.com'

  def contact_message(sender_name:, sender_email:, subject_text:, body_text:, uploads: [])
    uploads.each_with_index do |upload, index|
      filename = File.basename(upload.original_filename.to_s).gsub(/[^\p{L}\p{N}._-]/u, '_')
      filename = "attachment_#{index + 1}" if filename.empty?
      upload.rewind
      attachments[filename] = { mime_type: upload.content_type, content: upload.read }
    end
    mail(to: OWNER_EMAIL, from: OWNER_EMAIL, reply_to: sender_email,
         subject: "[Web Resume] #{subject_text}") do |format|
      format.text do
        render plain: "Новое обращение с Web Resume\n\nИмя: #{sender_name}\nEmail: #{sender_email}\n\nТема: #{subject_text}\n\nСообщение:\n#{body_text}\n"
      end
    end
  end
end
