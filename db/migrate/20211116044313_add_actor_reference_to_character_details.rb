class AddActorReferenceToCharacterDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :character_details, :actor_details, column: :actor_id
    add_index :character_details, :actor_id
    change_column_null :character_details, :actor_id, false
  end
end
