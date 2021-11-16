class ReviewDetail < ApplicationRecord
  # Direct associations

  belongs_to :movie

  belongs_to :user,
             class_name: "UserDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    movie.to_s
  end
end
