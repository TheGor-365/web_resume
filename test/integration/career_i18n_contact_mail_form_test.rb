require "test_helper"

class CareerI18nContactMailFormTest < ActionDispatch::IntegrationTest
  test "email form keeps Turbo frame, attachments and CSRF protection in EN and HY" do
    { en: "Send an email", hy: "Գրել էլեկտրոնային նամակ" }.each do |locale, heading|
      get "/#{locale}/contact_email"
      assert_response :success
      assert_includes response.body, heading
      assert_includes response.body, 'target="experience"'
      assert_includes response.body, "attachments[]"
      assert_includes response.body, "sender_email"
    end
  end

  test "all validation messages and form labels exist in every language" do
    I18n.available_locales.each do |locale|
      %w[heading intro sent name email subject message attachments attachments_note
         send not_configured].each do |key|
        assert I18n.t("site.contact_mail.#{key}", locale: locale, raise: true).present?
      end
      %w[name email subject message too_many bad_format file_type file_size
         honeypot mail_unconfigured rate_limit delivery].each do |key|
        assert I18n.t("site.contact_mail.errors.#{key}", locale: locale, raise: true).present?
      end
    end
  end
end
