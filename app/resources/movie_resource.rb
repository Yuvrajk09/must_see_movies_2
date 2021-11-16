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

  # Indirect associations

end