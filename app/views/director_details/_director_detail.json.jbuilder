json.extract! director_detail, :id, :director_id, :director_name, :director_dob, :director_bio, :director_image, :created_at, :updated_at
json.url director_detail_url(director_detail, format: :json)
