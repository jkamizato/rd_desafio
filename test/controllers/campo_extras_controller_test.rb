require 'test_helper'

class CampoExtrasControllerTest < ActionController::TestCase
  setup do
    @campo_extra = campo_extras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campo_extras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campo_extra" do
    assert_difference('CampoExtra.count') do
      post :create, campo_extra: { campo_tipo: @campo_extra.campo_tipo, label: @campo_extra.label, user_id: @campo_extra.user_id }
    end

    assert_redirected_to campo_extra_path(assigns(:campo_extra))
  end

  test "should show campo_extra" do
    get :show, id: @campo_extra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campo_extra
    assert_response :success
  end

  test "should update campo_extra" do
    patch :update, id: @campo_extra, campo_extra: { campo_tipo: @campo_extra.campo_tipo, label: @campo_extra.label, user_id: @campo_extra.user_id }
    assert_redirected_to campo_extra_path(assigns(:campo_extra))
  end

  test "should destroy campo_extra" do
    assert_difference('CampoExtra.count', -1) do
      delete :destroy, id: @campo_extra
    end

    assert_redirected_to campo_extras_path
  end
end
