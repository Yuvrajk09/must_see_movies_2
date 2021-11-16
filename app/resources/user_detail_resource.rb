class UserDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_email, :string
  attribute :user_id, :integer
  attribute :username, :string
  attribute :password, :string

  # Direct associations

  # Indirect associations

end
