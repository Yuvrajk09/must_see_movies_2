class DirectorDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :director_id, :integer
  attribute :director_name, :string
  attribute :director_dob, :string
  attribute :director_bio, :string
  attribute :director_image, :string

  # Direct associations

  # Indirect associations

end
