class UserDetail < ApplicationRecord
  # Direct associations

  has_many   :movies,
             :foreign_key => "movie_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :review_details,
             :through => :movies,
             :source => :review_details

  has_many   :bookmark_statuses,
             :through => :movies,
             :source => :bookmark_statuses

  # Validations

  # Scopes

  def to_s
    user_email
  end

end
