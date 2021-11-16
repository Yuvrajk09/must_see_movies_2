class AddMovieReferenceToBookmarkStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmark_statuses, :movies
    add_index :bookmark_statuses, :movie_id
    change_column_null :bookmark_statuses, :movie_id, false
  end
end
