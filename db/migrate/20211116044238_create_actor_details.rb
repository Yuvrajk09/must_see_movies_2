class CreateActorDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_details do |t|
      t.integer :actor_id
      t.string :actor_name
      t.string :actor_dob
      t.string :actor_bio
      t.string :actor_image

      t.timestamps
    end
  end
end
