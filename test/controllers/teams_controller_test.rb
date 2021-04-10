require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get teams_Index_url
    assert_response :success
  end

end
