json.extract! movie, :id, :movie_id, :movie_name, :movie_description, :movie_duration, :movie_year, :created_at, :updated_at
json.url movie_url(movie, format: :json)
