require 'test_helper'

class HelpersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get helpers_index_url
    assert_response :success
  end

end
