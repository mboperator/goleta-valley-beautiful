require 'test_helper'

class TreeStatusesControllerTest < ActionController::TestCase
  setup do
    @tree_status = tree_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tree_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tree_status" do
    assert_difference('TreeStatus.count') do
      post :create, tree_status: {  }
    end

    assert_redirected_to tree_status_path(assigns(:tree_status))
  end

  test "should show tree_status" do
    get :show, id: @tree_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tree_status
    assert_response :success
  end

  test "should update tree_status" do
    put :update, id: @tree_status, tree_status: {  }
    assert_redirected_to tree_status_path(assigns(:tree_status))
  end

  test "should destroy tree_status" do
    assert_difference('TreeStatus.count', -1) do
      delete :destroy, id: @tree_status
    end

    assert_redirected_to tree_statuses_path
  end
end
