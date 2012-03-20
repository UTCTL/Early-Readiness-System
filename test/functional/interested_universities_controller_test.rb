require 'test_helper'

class InterestedUniversitiesControllerTest < ActionController::TestCase
  setup do
    @interested_university = interested_universities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interested_universities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interested_university" do
    assert_difference('InterestedUniversity.count') do
      post :create, interested_university: @interested_university.attributes
    end

    assert_redirected_to interested_university_path(assigns(:interested_university))
  end

  test "should show interested_university" do
    get :show, id: @interested_university.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interested_university.to_param
    assert_response :success
  end

  test "should update interested_university" do
    put :update, id: @interested_university.to_param, interested_university: @interested_university.attributes
    assert_redirected_to interested_university_path(assigns(:interested_university))
  end

  test "should destroy interested_university" do
    assert_difference('InterestedUniversity.count', -1) do
      delete :destroy, id: @interested_university.to_param
    end

    assert_redirected_to interested_universities_path
  end
end
