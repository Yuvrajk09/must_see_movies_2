class UserDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_email, :string
  attribute :username, :string
  attribute :password, :string

  # Direct associations

  has_many   :review_details,
             foreign_key: :user_id

  has_many   :bookmark_statuses,
             foreign_key: :user_id

  # Indirect associations

  many_to_many :movies_reviews,
               resource: MovieResource

  many_to_many :movies_bookmarks,
               resource: MovieResource
end
