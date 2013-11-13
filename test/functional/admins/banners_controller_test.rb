require 'test_helper'

class Admins::BannersControllerTest < ActionController::TestCase
  setup do
    @admins_banner = admins_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_banner" do
    assert_difference('Admins::Banner.count') do
      post :create, admins_banner: { image: @admins_banner.image }
    end

    assert_redirected_to admins_banner_path(assigns(:admins_banner))
  end

  test "should calculator admins_banner" do
    get :calculator, id: @admins_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admins_banner
    assert_response :success
  end

  test "should update admins_banner" do
    put :update, id: @admins_banner, admins_banner: { image: @admins_banner.image }
    assert_redirected_to admins_banner_path(assigns(:admins_banner))
  end

  test "should destroy admins_banner" do
    assert_difference('Admins::Banner.count', -1) do
      delete :destroy, id: @admins_banner
    end

    assert_redirected_to admins_banners_path
  end
end
