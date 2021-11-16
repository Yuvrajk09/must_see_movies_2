class AddDirectorReferenceToDirectorDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :director_details, :movies, column: :director_id
    add_index :director_details, :director_id
    change_column_null :director_details, :director_id, false
  end
end
