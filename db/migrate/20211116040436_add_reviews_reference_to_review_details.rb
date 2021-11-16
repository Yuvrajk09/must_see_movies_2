class AddReviewsReferenceToReviewDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :review_details, :movies, column: :review_id
    add_index :review_details, :review_id
    change_column_null :review_details, :review_id, false
  end
end
