class CharacterDetail < ApplicationRecord
  # Direct associations

  belongs_to :actor,
             class_name: "ActorDetail"

  belongs_to :movie

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    movie.to_s
  end
end
