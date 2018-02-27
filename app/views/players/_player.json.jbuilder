json.extract! player, :id, :player_name, :life_points, :attack_points, :profile_pic, :experience, :created_at, :updated_at
json.url player_url(player, format: :json)
