class AddMovieReferenceToReviewDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :review_details, :movies
    add_index :review_details, :movie_id
    change_column_null :review_details, :movie_id, false
  end
end
