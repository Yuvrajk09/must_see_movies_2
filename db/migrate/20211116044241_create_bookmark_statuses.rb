class CreateBookmarkStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmark_statuses do |t|
      t.integer :movie_id
      t.string :bookmark_status
      t.integer :user_id

      t.timestamps
    end
  end
end
