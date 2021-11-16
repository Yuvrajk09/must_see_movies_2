class Movie < ApplicationRecord
  # Direct associations

  has_one    :director_detail,
             :foreign_key => "director_id",
             :dependent => :destroy

  belongs_to :movie,
             :class_name => "UserDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    movie.to_s
  end

end
