require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test 'should also get index' do
    get flights_path
    assert_response :success
  end
end
