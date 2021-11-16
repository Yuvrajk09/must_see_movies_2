class CreateCharacterDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :character_details do |t|
      t.integer :movie_id
      t.integer :actor_id
      t.string :character_name

      t.timestamps
    end
  end
end
