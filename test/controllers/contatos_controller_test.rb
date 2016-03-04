require 'test_helper'

class ContatosControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @contato = contatos(:fulano)
    @user = users(:julio)
  end

  test "No authorized. Redirect" do
    get :index
    assert_redirected_to new_user_session_path
    get :new
    assert_redirected_to new_user_session_path
    get :show, id: @contato
    assert_redirected_to new_user_session_path
    get :edit, id: @contato
    assert_redirected_to new_user_session_path
  end

  test "should NOT create contato. Redirected" do
    assert_no_difference('Contato.count') do
      post :create, contato: { email: @contato.email, user_id: @contato.user_id }
    end
    assert_redirected_to new_user_session_path
  end

  test "should update contato Redirected" do
    patch :update, id: @contato, contato: { email: @contato.email, user_id: @contato.user_id }
    assert_redirected_to new_user_session_path
  end

  test "should destroy contato. Redirected" do
    assert_difference('Contato.count', 0) do
      delete :destroy, id: @contato
    end
    assert_redirected_to new_user_session_path
  end

  test 'authorizes to index' do
    sign_in @user
    get :index
    assert_response :success
  end

  test 'authorizes to new' do
    sign_in @user
    get :new
    assert_response :success
  end

  test 'should not save without email' do
    contato = Contato.new
    assert_not contato.save
    assert contato.email = "asdf@asdf.com"
    assert contato.save
  end
end
