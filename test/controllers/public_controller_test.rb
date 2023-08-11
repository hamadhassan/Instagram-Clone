require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get public_homepage_url
    assert_response :success
  end
end
