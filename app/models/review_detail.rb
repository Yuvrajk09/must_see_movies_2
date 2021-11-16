class ReviewDetail < ApplicationRecord
  # Direct associations

  belongs_to :reviews,
             class_name: "Movie",
             foreign_key: "review_id"

  # Indirect associations

  has_one    :movie,
             through: :reviews,
             source: :movie

  # Validations

  # Scopes

  def to_s
    reviews.to_s
  end
end
