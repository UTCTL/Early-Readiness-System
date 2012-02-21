require 'test_helper'

class ExamSubjectsControllerTest < ActionController::TestCase
  setup do
    @exam_subject = exam_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_subject" do
    assert_difference('ExamSubject.count') do
      post :create, exam_subject: @exam_subject.attributes
    end

    assert_redirected_to exam_subject_path(assigns(:exam_subject))
  end

  test "should show exam_subject" do
    get :show, id: @exam_subject.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_subject.to_param
    assert_response :success
  end

  test "should update exam_subject" do
    put :update, id: @exam_subject.to_param, exam_subject: @exam_subject.attributes
    assert_redirected_to exam_subject_path(assigns(:exam_subject))
  end

  test "should destroy exam_subject" do
    assert_difference('ExamSubject.count', -1) do
      delete :destroy, id: @exam_subject.to_param
    end

    assert_redirected_to exam_subjects_path
  end
end
