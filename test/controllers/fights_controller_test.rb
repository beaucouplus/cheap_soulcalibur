require 'test_helper'

class FightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fight = fights(:one)
  end

  test "should get new" do
    get new_fight_url
    assert_response :success
  end

  test "should get index" do
    get fights_url
    assert_response :success
  end

  test "should create fight" do
    assert_difference('Fight.count') do
      post fights_url, params: { fight: { player_1: @fight.first_player.id,player_2: @fight.second_player.id , winner: @fight.has_won.id, summary: @fight.summary, weapon_1: @fight.first_weapon.id , weapon_2: @fight.second_weapon.id } }
    end

    assert_redirected_to edit_fight_url(@fight.id + 1)
  end

  test "should get edit" do
    get edit_fight_url(@fight)
    assert_response :success
  end

  #unable to make it go green :(
  test "should update fight" do
    get edit_fight_url(@fight)
    patch fight_url(@fight), params: { fight: { player_1: @fight.first_player.id,player_2: @fight.second_player.id , winner: @fight.has_won.id, summary: @fight.summary, weapon_1: @fight.first_weapon.id , weapon_2: @fight.second_weapon.id } }
    assert_redirected_to fight_url(@fight)
  end

  test "should get show" do
    get fight_url(@fight)
    assert_response :success
  end


  # unable to make it go green too
  test "should get play" do
    get edit_fight_url(@fight)
    params =
    {
      play: {
        id: @fight.id,
      }, player: "first_player",
      format: :js
    }
    get play_url(params)
    assert_response :success
  end


end
