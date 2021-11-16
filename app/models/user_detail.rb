class UserDetail < ApplicationRecord
  # Direct associations

  has_many   :review_details,
             foreign_key: "user_id",
             dependent: :destroy

  has_many   :bookmark_statuses,
             foreign_key: "user_id",
             dependent: :destroy

  # Indirect associations

  has_many   :movies_reviews,
             through: :review_details,
             source: :movie

  has_many   :movies_bookmarks,
             through: :bookmark_statuses,
             source: :movie

  # Validations

  # Scopes

  def to_s
    user_email
  end
end
