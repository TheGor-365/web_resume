require 'test_helper'

class CareerContactMailTest < ActionDispatch::IntegrationTest
  test 'email form replaces only the right-side turbo frame' do
    get contact_email_path
    assert_response :success
    assert_includes response.body, 'target="experience"'
    assert_includes response.body, 'sender_email'
  end

  test 'invalid email message is rejected without calling smtp' do
    post send_contact_email_path, params: {
      sender_name: 'Test', sender_email: 'invalid',
      subject_text: 'Bug', body_text: 'A sufficiently long test description'
    }
    assert_response :success
    assert_includes response.body, 'действительный email'
  end
end
