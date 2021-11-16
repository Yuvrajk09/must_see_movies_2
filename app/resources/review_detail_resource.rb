class ReviewDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :review_id, :integer
  attribute :review, :string
  attribute :star_ratings, :string

  # Direct associations

  belongs_to :reviews,
             resource: MovieResource,
             foreign_key: :review_id

  # Indirect associations

end
