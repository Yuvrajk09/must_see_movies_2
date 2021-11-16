json.extract! movie, :id, :user_id, :movie_name, :movie_description,
              :movie_duration, :movie_year, :movie_image, :director_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
