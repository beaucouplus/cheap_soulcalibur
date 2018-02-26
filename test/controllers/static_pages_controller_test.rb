require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "root should be defined" do
    get root_path
    assert_response :success
  end

  test "root should return static_pages_home_path" do
    assert_routing root_path, controller: 'static_pages', action: 'home'
  end

end
