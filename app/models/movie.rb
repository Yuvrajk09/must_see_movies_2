class Movie < ApplicationRecord
  # Direct associations

  belongs_to :movie,
             :class_name => "UserDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    movie.to_s
  end

end
