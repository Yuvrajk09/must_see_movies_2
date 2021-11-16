class BookmarkStatus < ApplicationRecord
  # Direct associations

  belongs_to :bookmark,
             class_name: "Movie"

  # Indirect associations

  has_one    :movie,
             through: :bookmark,
             source: :movie

  # Validations

  # Scopes

  def to_s
    bookmark.to_s
  end
end
