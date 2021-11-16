class AddUserReferenceToReviewDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :review_details, :user_details, column: :user_id
    add_index :review_details, :user_id
    change_column_null :review_details, :user_id, false
  end
end
