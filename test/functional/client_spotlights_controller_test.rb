require 'test_helper'

class ClientSpotlightsControllerTest < ActionController::TestCase
  setup do
    @client_spotlight = client_spotlights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_spotlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_spotlight" do
    assert_difference('ClientSpotlight.count') do
      post :create, client_spotlight: { description: @client_spotlight.description, image: @client_spotlight.image, name: @client_spotlight.name, type: @client_spotlight.type }
    end

    assert_redirected_to client_spotlight_path(assigns(:client_spotlight))
  end

  test "should show client_spotlight" do
    get :show, id: @client_spotlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_spotlight
    assert_response :success
  end

  test "should update client_spotlight" do
    put :update, id: @client_spotlight, client_spotlight: { description: @client_spotlight.description, image: @client_spotlight.image, name: @client_spotlight.name, type: @client_spotlight.type }
    assert_redirected_to client_spotlight_path(assigns(:client_spotlight))
  end

  test "should destroy client_spotlight" do
    assert_difference('ClientSpotlight.count', -1) do
      delete :destroy, id: @client_spotlight
    end

    assert_redirected_to client_spotlights_path
  end
end
