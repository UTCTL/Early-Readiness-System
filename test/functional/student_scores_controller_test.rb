require 'test_helper'

class StudentScoresControllerTest < ActionController::TestCase
  setup do
    @student_score = student_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_score" do
    assert_difference('StudentScore.count') do
      post :create, student_score: @student_score.attributes
    end

    assert_redirected_to student_score_path(assigns(:student_score))
  end

  test "should show student_score" do
    get :show, id: @student_score.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_score.to_param
    assert_response :success
  end

  test "should update student_score" do
    put :update, id: @student_score.to_param, student_score: @student_score.attributes
    assert_redirected_to student_score_path(assigns(:student_score))
  end

  test "should destroy student_score" do
    assert_difference('StudentScore.count', -1) do
      delete :destroy, id: @student_score.to_param
    end

    assert_redirected_to student_scores_path
  end
end
