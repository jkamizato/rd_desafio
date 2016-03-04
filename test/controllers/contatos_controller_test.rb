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

  test 'should create a contato post when logged' do
    sign_in @user
    assert_difference('Contato.count') do
      post :create, contato: { email: "asfasdfas@asdfasdf.com", user_id: @contato.user_id }
    end
    assert_redirected_to contato_path(assigns(:contato))
    assert_equal 'Contato was successfully created.', flash[:notice]
  end

  test 'should show contato when logged' do
    sign_in @user
    get :show, id: @contato
    assert_response :success
  end

  test 'should get edit when logged' do
    sign_in @user
    get :edit, id: @contato
    assert_response :success
  end

  test 'should update when logged' do
    sign_in @user
    patch :update, id: @contato, contato: { context: @contato.email, user_id: @contato.user_id }
    assert_redirected_to contato_path(assigns(:contato))
    assert_equal 'Contato was successfully updated.', flash[:notice]
  end

  test 'should delete when logged' do
    sign_in @user
    assert_difference('Contato.count', -1) do
      delete :destroy, id: @contato
    end
    assert_redirected_to contatos_path
    assert_equal 'Contato was successfully destroyed.', flash[:notice]
  end
end


