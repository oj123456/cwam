require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get interviews_show_url
    assert_response :success
  end

end
