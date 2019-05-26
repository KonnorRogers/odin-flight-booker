require 'test_helper'

class BookingsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookings_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get bookings_controller_create_url
    assert_response :success
  end

  test "should get show" do
    get bookings_controller_show_url
    assert_response :success
  end

end
