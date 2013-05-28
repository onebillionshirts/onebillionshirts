require 'test_helper'

class Admin::ShirtOptionsControllerTest < ActionController::TestCase
  setup do
    @admin_shirt_option = admin_shirt_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_shirt_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_shirt_option" do
    assert_difference('Admin::ShirtOption.count') do
      post :create, admin_shirt_option: { name: @admin_shirt_option.name }
    end

    assert_redirected_to admin_shirt_option_path(assigns(:admin_shirt_option))
  end

  test "should calculator admin_shirt_option" do
    get :calculator, id: @admin_shirt_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_shirt_option
    assert_response :success
  end

  test "should update admin_shirt_option" do
    put :update, id: @admin_shirt_option, admin_shirt_option: { name: @admin_shirt_option.name }
    assert_redirected_to admin_shirt_option_path(assigns(:admin_shirt_option))
  end

  test "should destroy admin_shirt_option" do
    assert_difference('Admin::ShirtOption.count', -1) do
      delete :destroy, id: @admin_shirt_option
    end

    assert_redirected_to admin_shirt_options_path
  end
end
