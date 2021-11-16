json.extract! review_detail, :id, :movie_id, :review, :star_ratings, :user_id,
              :created_at, :updated_at
json.url review_detail_url(review_detail, format: :json)
