class AddActorsReferenceToActorDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :actor_details, :movies, column: :actor_id
    add_index :actor_details, :actor_id
    change_column_null :actor_details, :actor_id, false
  end
end
