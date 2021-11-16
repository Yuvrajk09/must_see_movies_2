class CreateBookmarkStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmark_statuses do |t|
      t.integer :bookmark_id
      t.string :bookmark_status

      t.timestamps
    end
  end
end
