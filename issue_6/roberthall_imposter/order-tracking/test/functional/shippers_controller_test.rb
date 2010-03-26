require 'test_helper'

class ShippersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shippers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipper" do
    assert_difference('Shipper.count') do
      post :create, :shipper => { }
    end

    assert_redirected_to shipper_path(assigns(:shipper))
  end

  test "should show shipper" do
    get :show, :id => shippers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shippers(:one).to_param
    assert_response :success
  end

  test "should update shipper" do
    put :update, :id => shippers(:one).to_param, :shipper => { }
    assert_redirected_to shipper_path(assigns(:shipper))
  end

  test "should destroy shipper" do
    assert_difference('Shipper.count', -1) do
      delete :destroy, :id => shippers(:one).to_param
    end

    assert_redirected_to shippers_path
  end
end
