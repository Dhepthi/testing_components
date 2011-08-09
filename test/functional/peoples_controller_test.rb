require 'test_helper'

class PeoplesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peoples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people" do
    assert_difference('People.count') do
      post :create, :people => { }
    end

    assert_redirected_to people_path(assigns(:people))
  end

  test "should show people" do
    get :show, :id => peoples(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => peoples(:one).to_param
    assert_response :success
  end

  test "should update people" do
    put :update, :id => peoples(:one).to_param, :people => { }
    assert_redirected_to people_path(assigns(:people))
  end

  test "should destroy people" do
    assert_difference('People.count', -1) do
      delete :destroy, :id => peoples(:one).to_param
    end

    assert_redirected_to peoples_path
  end
end
