require 'test_helper'

class QuestionsCategoriesControllerTest < ActionController::TestCase
  setup do
    @questions_category = questions_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questions_category" do
    assert_difference('QuestionsCategory.count') do
      post :create, questions_category: { category: @questions_category.category }
    end

    assert_redirected_to questions_category_path(assigns(:questions_category))
  end

  test "should show questions_category" do
    get :show, id: @questions_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questions_category
    assert_response :success
  end

  test "should update questions_category" do
    put :update, id: @questions_category, questions_category: { category: @questions_category.category }
    assert_redirected_to questions_category_path(assigns(:questions_category))
  end

  test "should destroy questions_category" do
    assert_difference('QuestionsCategory.count', -1) do
      delete :destroy, id: @questions_category
    end

    assert_redirected_to questions_categories_path
  end
end
