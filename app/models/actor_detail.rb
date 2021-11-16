class ActorDetail < ApplicationRecord
  # Direct associations

  has_many   :character_details,
             foreign_key: "actor_id",
             dependent: :destroy

  # Indirect associations

  has_many   :movies,
             through: :character_details,
             source: :movie

  # Validations

  # Scopes

  def to_s
    actor_id
  end
end
