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

  has_one    :movie,
             resource: UserDetailResource

  filter :movie_id, :integer do
    eq do |scope, value|
      scope.eager_load(:movie).where(:movies => {:movie_id => value})
    end
  end
end
