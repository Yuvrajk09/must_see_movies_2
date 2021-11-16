json.extract! review_detail, :id, :review_id, :review, :star_ratings,
              :created_at, :updated_at
json.url review_detail_url(review_detail, format: :json)
