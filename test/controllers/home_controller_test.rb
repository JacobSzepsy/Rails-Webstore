require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get home_get_url
    assert_response :success
  end
end
