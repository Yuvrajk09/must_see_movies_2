class DirectorDetail < ApplicationRecord
  # Direct associations

  belongs_to :director,
             :class_name => "Movie"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    director.to_s
  end

end
