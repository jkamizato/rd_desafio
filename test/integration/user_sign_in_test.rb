require 'test_helper'

class UserSignInTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout form" do
    get new_user_session_path
    assert_select 'input#user_email'
    assert_select 'input#user_password'
    assert_select 'form input[type=submit]'
    assert_select 'a[href=?]', new_user_registration_path
  end

  test 'sigin invalid passord' do
    get new_user_session_path
    post user_session_path, user: {email: "asdf@asdf.com", password: "123"}
    assert_not flash.empty?
  end
end
