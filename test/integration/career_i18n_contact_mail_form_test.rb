require "test_helper"

class CareerI18nContactMailFormTest < ActionDispatch::IntegrationTest
  test "email form keeps Turbo frame, attachments and CSRF protection in EN and HY" do
    { en: ["Send an email", "Choose files", "No files selected"],
      hy: ["Գրել էլեկտրոնային նամակ", "Ընտրել ֆայլեր", "Ֆայլեր ընտրված չեն"] }.each do |locale, (heading, picker, empty)|
      get "/#{locale}/contact_email"
      assert_response :success
      assert_includes response.body, heading
      assert_includes response.body, 'target="experience"'
      assert_includes response.body, "attachments[]"
      assert_includes response.body, "sender_email"
      assert_includes response.body, picker
      assert_includes response.body, empty
      assert_includes response.body, 'data-controller="career-attachments"'
      assert_includes response.body, 'id="career-contact-attachments"'
      assert_includes response.body, 'for="career-contact-attachments"'
    end
  end

  test "all validation messages and form labels exist in every language" do
    I18n.available_locales.each do |locale|
      %w[heading intro sent name email subject message attachments attachments_note
         send not_configured choose_files no_files_selected].each do |key|
        assert I18n.t("site.contact_mail.#{key}", locale: locale, raise: true).present?
      end
      %w[name email subject message too_many bad_format file_type file_size
         honeypot mail_unconfigured rate_limit delivery].each do |key|
        assert I18n.t("site.contact_mail.errors.#{key}", locale: locale, raise: true).present?
      end
    end
  end
end
