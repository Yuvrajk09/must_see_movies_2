class BookmarkStatus < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    bookmark.to_s
  end

end
