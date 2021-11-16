class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :movie_name, :string
  attribute :movie_description, :string
  attribute :movie_duration, :string
  attribute :movie_year, :string
  attribute :movie_image, :string
  attribute :director_id, :integer

  # Direct associations

  belongs_to :director,
             resource: DirectorDetailResource

  has_many   :character_details

  has_many   :bookmark_statuses

  has_many   :review_details

  # Indirect associations

  many_to_many :users_reviews,
               resource: UserDetailResource

  many_to_many :users,
               resource: UserDetailResource

  many_to_many :actors,
               resource: ActorDetailResource
end
