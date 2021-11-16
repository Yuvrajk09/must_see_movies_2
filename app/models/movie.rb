class Movie < ApplicationRecord
  # Direct associations

  has_many   :bookmark_statuses,
             foreign_key: "bookmark_id",
             dependent: :destroy

  has_many   :review_details,
             foreign_key: "review_id",
             dependent: :destroy

  has_many   :actor_details,
             foreign_key: "actor_id",
             dependent: :destroy

  has_one    :director_detail,
             foreign_key: "director_id",
             dependent: :destroy

  belongs_to :movie,
             class_name: "UserDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    movie.to_s
  end
end
