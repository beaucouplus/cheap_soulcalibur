require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:first_player)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      image = fixture_file_upload('files/mitsurugi.jpg', 'image/jpg')
      post players_url, params: { player: { attack_points: @player.attack_points, experience: @player.experience, life_points: @player.life_points, player_name: "Voldo", image: image } }
    end

    assert_redirected_to new_fight_url
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    image = fixture_file_upload('files/mitsurugi.jpg', 'image/jpg')
    patch player_url(@player), params: { player: { attack_points: @player.attack_points, experience: @player.experience, life_points: @player.life_points, player_name: @player.player_name, image: image } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
end
