class CharacterDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :movie_id, :integer
  attribute :actor_id, :integer
  attribute :character_name, :string

  # Direct associations

  belongs_to :actor,
             resource: ActorDetailResource

  belongs_to :movie

  # Indirect associations
end
