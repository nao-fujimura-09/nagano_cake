require "test_helper"

class Admin::OrderDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_order_detail_update_url
    assert_response :success
  end
end
