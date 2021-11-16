class AddUserReferenceToBookmarkStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmark_statuses, :user_details, column: :user_id
    add_index :bookmark_statuses, :user_id
    change_column_null :bookmark_statuses, :user_id, false
  end
end
