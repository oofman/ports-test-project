require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "index_old - should redirect unauthenticated" do
    get root_url
    assert_response :redirect
  end
end
