class BookmarkStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :movie_id, :integer
  attribute :bookmark_status, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :movie

  belongs_to :user,
             resource: UserDetailResource

  # Indirect associations
end
