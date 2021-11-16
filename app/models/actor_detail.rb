class ActorDetail < ApplicationRecord
  # Direct associations

  belongs_to :actors,
             :class_name => "Movie",
             :foreign_key => "actor_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    actors.to_s
  end

end
