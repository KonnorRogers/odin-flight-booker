require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get redirect to root_url" do
    get new_booking_path
    assert_response :redirect
  end
end
