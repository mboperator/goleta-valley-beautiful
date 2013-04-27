require 'test_helper'

class TreesControllerTest < ActionController::TestCase
  setup do
    @tree = trees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tree" do
    assert_difference('Tree.count') do
      post :create, tree: { city: @tree.city, common_name: @tree.common_name, diameter_at_height: @tree.diameter_at_height, genus: @tree.genus, grove: @tree.grove, height: @tree.height, species: @tree.species, spread: @tree.spread, state: @tree.state, street: @tree.street, street_no: @tree.street_no }
    end

    assert_redirected_to tree_path(assigns(:tree))
  end

  test "should show tree" do
    get :show, id: @tree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tree
    assert_response :success
  end

  test "should update tree" do
    put :update, id: @tree, tree: { city: @tree.city, common_name: @tree.common_name, diameter_at_height: @tree.diameter_at_height, genus: @tree.genus, grove: @tree.grove, height: @tree.height, species: @tree.species, spread: @tree.spread, state: @tree.state, street: @tree.street, street_no: @tree.street_no }
    assert_redirected_to tree_path(assigns(:tree))
  end

  test "should destroy tree" do
    assert_difference('Tree.count', -1) do
      delete :destroy, id: @tree
    end

    assert_redirected_to trees_path
  end
end
