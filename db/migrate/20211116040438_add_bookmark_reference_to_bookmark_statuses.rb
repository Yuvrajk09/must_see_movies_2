class AddBookmarkReferenceToBookmarkStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmark_statuses, :movies, column: :bookmark_id
    add_index :bookmark_statuses, :bookmark_id
    change_column_null :bookmark_statuses, :bookmark_id, false
  end
end
