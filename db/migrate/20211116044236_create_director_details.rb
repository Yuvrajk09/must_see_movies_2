class CreateDirectorDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :director_details do |t|
      t.integer :director_id
      t.string :director_name
      t.string :director_dob
      t.string :director_bio
      t.string :director_image

      t.timestamps
    end
  end
end
