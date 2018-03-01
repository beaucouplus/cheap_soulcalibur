require 'test_helper'

class FightingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fightings_new_url
    assert_response :success
  end

  test "should get index" do
    get fightings_index_url
    assert_response :success
  end

  test "should get show" do
    get fightings_show_url
    assert_response :success
  end

end
