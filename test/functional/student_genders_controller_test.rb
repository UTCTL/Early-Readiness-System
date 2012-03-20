require 'test_helper'

class StudentGendersControllerTest < ActionController::TestCase
  setup do
    @student_gender = student_genders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_genders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_gender" do
    assert_difference('StudentGender.count') do
      post :create, student_gender: @student_gender.attributes
    end

    assert_redirected_to student_gender_path(assigns(:student_gender))
  end

  test "should show student_gender" do
    get :show, id: @student_gender.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_gender.to_param
    assert_response :success
  end

  test "should update student_gender" do
    put :update, id: @student_gender.to_param, student_gender: @student_gender.attributes
    assert_redirected_to student_gender_path(assigns(:student_gender))
  end

  test "should destroy student_gender" do
    assert_difference('StudentGender.count', -1) do
      delete :destroy, id: @student_gender.to_param
    end

    assert_redirected_to student_genders_path
  end
end
