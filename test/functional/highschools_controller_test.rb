require 'test_helper'

class HighschoolsControllerTest < ActionController::TestCase
  setup do
    @highschool = highschools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highschools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highschool" do
    assert_difference('Highschool.count') do
      post :create, highschool: @highschool.attributes
    end

    assert_redirected_to highschool_path(assigns(:highschool))
  end

  test "should show highschool" do
    get :show, id: @highschool.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @highschool.to_param
    assert_response :success
  end

  test "should update highschool" do
    put :update, id: @highschool.to_param, highschool: @highschool.attributes
    assert_redirected_to highschool_path(assigns(:highschool))
  end

  test "should destroy highschool" do
    assert_difference('Highschool.count', -1) do
      delete :destroy, id: @highschool.to_param
    end

    assert_redirected_to highschools_path
  end
end
