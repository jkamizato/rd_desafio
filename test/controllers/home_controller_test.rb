require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:julio)
  end

  test 'header menu' do
    sign_in @user
    get 'index'
    assert_select 'a[href=?]',  destroy_user_session_path
    assert_select 'a[href=?]',  campo_extras_path
    assert_select 'a[href=?]',  contatos_path
  end

end
