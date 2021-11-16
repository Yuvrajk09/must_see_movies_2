json.extract! bookmark_status, :id, :movie_id, :bookmark_status, :user_id,
              :created_at, :updated_at
json.url bookmark_status_url(bookmark_status, format: :json)
