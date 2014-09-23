require 'test_helper'

class CarsControllerTest < ActionController::TestCase
  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post :create, car: { age: @car.age, brand_id: @car.brand_id, color_id: @car.color_id, description: @car.description, image: @car.image, mileage: @car.mileage, title: @car.title, type_id: @car.type_id, user_id: @car.user_id }
    end

    assert_redirected_to car_path(assigns(:car))
  end

  test "should show car" do
    get :show, id: @car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car
    assert_response :success
  end

  test "should update car" do
    patch :update, id: @car, car: { age: @car.age, brand_id: @car.brand_id, color_id: @car.color_id, description: @car.description, image: @car.image, mileage: @car.mileage, title: @car.title, type_id: @car.type_id, user_id: @car.user_id }
    assert_redirected_to car_path(assigns(:car))
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete :destroy, id: @car
    end

    assert_redirected_to cars_path
  end
end
