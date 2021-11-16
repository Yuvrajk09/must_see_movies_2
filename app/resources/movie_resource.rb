class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :movie_id, :integer
  attribute :movie_name, :string
  attribute :movie_description, :string
  attribute :movie_duration, :string
  attribute :movie_year, :string

  # Direct associations

  has_many   :bookmark_statuses,
             foreign_key: :bookmark_id

  has_many   :review_details,
             foreign_key: :review_id

  has_many   :actor_details,
             foreign_key: :actor_id

  has_one    :director_detail,
             foreign_key: :director_id

  belongs_to :movie,
             resource: UserDetailResource

  # Indirect associations

end
