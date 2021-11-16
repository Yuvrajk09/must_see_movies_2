class BookmarkStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :bookmark_id, :integer
  attribute :bookmark_status, :string

  # Direct associations

  belongs_to :bookmark,
             resource: MovieResource

  # Indirect associations

  has_one    :movie,
             resource: UserDetailResource

  filter :movie_id, :integer do
    eq do |scope, value|
      scope.eager_load(:movie).where(movies: { movie_id: value })
    end
  end
end
