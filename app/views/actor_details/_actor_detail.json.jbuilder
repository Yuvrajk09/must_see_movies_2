json.extract! actor_detail, :id, :actor_id, :actor_name, :actor_dob,
              :actor_bio, :actor_image, :created_at, :updated_at
json.url actor_detail_url(actor_detail, format: :json)
