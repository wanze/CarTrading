require 'test_helper'

class BidSettingsControllerTest < ActionController::TestCase
  setup do
    @bid_setting = bid_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_setting" do
    assert_difference('BidSetting.count') do
      post :create, bid_setting: { automatic: @bid_setting.automatic, max_amount: @bid_setting.max_amount, offer_id: @bid_setting.offer_id, user_id: @bid_setting.user_id }
    end

    assert_redirected_to bid_setting_path(assigns(:bid_setting))
  end

  test "should show bid_setting" do
    get :show, id: @bid_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_setting
    assert_response :success
  end

  test "should update bid_setting" do
    patch :update, id: @bid_setting, bid_setting: { automatic: @bid_setting.automatic, max_amount: @bid_setting.max_amount, offer_id: @bid_setting.offer_id, user_id: @bid_setting.user_id }
    assert_redirected_to bid_setting_path(assigns(:bid_setting))
  end

  test "should destroy bid_setting" do
    assert_difference('BidSetting.count', -1) do
      delete :destroy, id: @bid_setting
    end

    assert_redirected_to bid_settings_path
  end
end
