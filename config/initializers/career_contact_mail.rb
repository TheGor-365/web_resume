# frozen_string_literal: true

# Credentials must be passed by the environment; never commit app passwords.
if ENV['CAREER_GMAIL_APP_PASSWORD'].to_s.length > 0
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com', port: 587, domain: 'gmail.com',
    user_name: '7495500@gmail.com', password: ENV.fetch('CAREER_GMAIL_APP_PASSWORD'),
    authentication: :plain, enable_starttls_auto: true,
    open_timeout: 5, read_timeout: 10
  }
  ActionMailer::Base.raise_delivery_errors = true
end

Rails.application.config.filter_parameters += [:sender_email, :body_text, :attachments, :career_gmail_app_password]
