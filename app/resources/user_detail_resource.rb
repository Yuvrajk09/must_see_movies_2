class UserDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_email, :string
  attribute :user_id, :integer
  attribute :username, :string
  attribute :password, :string

  # Direct associations

  has_many   :movies,
             foreign_key: :movie_id

  # Indirect associations

  has_many :bookmark_statuses do
    assign_each do |user_detail, bookmark_statuses|
      bookmark_statuses.select do |b|
        b.id.in?(user_detail.bookmark_statuses.map(&:id))
      end
    end
  end

end
