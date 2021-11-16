json.extract! character_detail, :id, :movie_id, :actor_id, :character_name,
              :created_at, :updated_at
json.url character_detail_url(character_detail, format: :json)
