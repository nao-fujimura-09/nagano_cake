require "test_helper"

class OdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get oders_new_url
    assert_response :success
  end

  test "should get comfirm" do
    get oders_comfirm_url
    assert_response :success
  end

  test "should get thanks" do
    get oders_thanks_url
    assert_response :success
  end

  test "should get index" do
    get oders_index_url
    assert_response :success
  end

  test "should get show" do
    get oders_show_url
    assert_response :success
  end
end
