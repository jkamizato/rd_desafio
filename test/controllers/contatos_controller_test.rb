require 'test_helper'

class ContatosControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @contato = contatos(:julio)
  end

  test "should get index. Redirected" do
    get :index
    assert_redirected_to new_user_session_path
    # assert_response :success
    # assert_not_nil assigns(:contatos)
  end

  test "should get new Redirected" do
    get :new
    assert_redirected_to new_user_session_path
    # assert_response :success
  end

  test "should NOT create contato. Redirected" do
    assert_no_difference('Contato.count') do
      post :create, contato: { email: @contato.email, user_id: @contato.user_id }
    end

    assert_redirected_to new_user_session_path
    # assert_redirected_to contato_path(assigns(:contato))
  end

  test "should show contato Redirected" do
    get :show, id: @contato
    # assert_response :success
    assert_redirected_to new_user_session_path
  end

  test "should get edit Redireted" do
    get :edit, id: @contato
    # assert_response :success
    assert_redirected_to new_user_session_path
  end

  test "should update contato Redirected" do
    patch :update, id: @contato, contato: { email: @contato.email, user_id: @contato.user_id }
    # assert_redirected_to contato_path(assigns(:contato))
    assert_redirected_to new_user_session_path
  end

  test "should destroy contato. Redirected" do
    assert_difference('Contato.count', 0) do
      delete :destroy, id: @contato
    end

    assert_redirected_to new_user_session_path
    #assert_redirected_to contatos_path
  end
end
