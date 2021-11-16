class UserDetail < ApplicationRecord
  # Direct associations

  has_many   :movies,
             :foreign_key => "movie_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user_email
  end

end
