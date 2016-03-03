require 'test_helper'

class CampoExtrasControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @campo_extra = campo_extras(:one)
  end

  test "should get index - Redirected" do
    get :index
    assert_redirected_to new_user_session_path
  end

  test "should get new - Redirected" do
    get :new
    assert_redirected_to new_user_session_path
  end


  test "should create campo_extra - Redirected" do
    assert_no_difference('CampoExtra.count') do
      post :create, campo_extra: { campo_tipo: @campo_extra.campo_tipo, label: @campo_extra.label, user_id: @campo_extra.user_id }
    end

    assert_redirected_to new_user_session_path
  end


  test "should show campo_extra Redirected" do
    get :show, id: @campo_extra
    # assert_response :success
    assert_redirected_to new_user_session_path
  end

  test "should get edit Redirected" do
    get :edit, id: @campo_extra
    # assert_response :success
    assert_redirected_to new_user_session_path
  end

  test "should update campo_extra Redirected" do
    patch :update, id: @campo_extra, campo_extra: { campo_tipo: @campo_extra.campo_tipo, label: @campo_extra.label, user_id: @campo_extra.user_id }
    # assert_redirected_to campo_extra_path(assigns(:campo_extra))
    assert_redirected_to new_user_session_path
  end

  test "should destroy campo_extra. Not logged" do
    assert_difference('CampoExtra.count', 0) do
      delete :destroy, id: @campo_extra
    end
    assert_redirected_to new_user_session_path
  end
end
