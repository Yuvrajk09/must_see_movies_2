class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director,
             class_name: "DirectorDetail"

  has_many   :character_details,
             dependent: :destroy

  has_many   :bookmark_statuses,
             dependent: :destroy

  has_many   :review_details,
             dependent: :destroy

  # Indirect associations

  has_many   :users_reviews,
             through: :review_details,
             source: :user

  has_many   :users,
             through: :bookmark_statuses,
             source: :user

  has_many   :actors,
             through: :character_details,
             source: :actor

  # Validations

  # Scopes

  def to_s
    user_id
  end
end
