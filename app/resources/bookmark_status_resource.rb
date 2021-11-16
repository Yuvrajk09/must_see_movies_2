class BookmarkStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :bookmark_id, :integer
  attribute :bookmark_status, :string

  # Direct associations

  # Indirect associations

end
