class AddMovieReferenceToMovies < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :movies, :user_details, column: :movie_id
    add_index :movies, :movie_id
    change_column_null :movies, :movie_id, false
  end
end
