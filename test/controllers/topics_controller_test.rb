require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get topics_new_url
    assert_response :success
  end

end
