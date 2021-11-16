class BookmarkStatus < ApplicationRecord
  # Direct associations

  belongs_to :bookmark,
             :class_name => "Movie"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    bookmark.to_s
  end

end
