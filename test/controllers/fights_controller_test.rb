require 'test_helper'

class FightsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fights_new_url
    assert_response :success
  end

  test "should get index" do
    get fights_index_url
    assert_response :success
  end

end
