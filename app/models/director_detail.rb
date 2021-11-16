class DirectorDetail < ApplicationRecord
  # Direct associations

  has_many   :movies,
             foreign_key: "director_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    director_id
  end
end
