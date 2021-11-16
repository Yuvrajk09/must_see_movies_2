class ReviewDetail < ApplicationRecord
  # Direct associations

  belongs_to :reviews,
             :class_name => "Movie",
             :foreign_key => "review_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    reviews.to_s
  end

end
