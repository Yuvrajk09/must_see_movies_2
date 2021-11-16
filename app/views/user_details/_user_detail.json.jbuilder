json.extract! user_detail, :id, :user_email, :username, :password, :created_at,
              :updated_at
json.url user_detail_url(user_detail, format: :json)
