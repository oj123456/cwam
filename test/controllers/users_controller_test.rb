require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get recipe_box" do
    get users_recipe_box_url
    assert_response :success
  end

end
