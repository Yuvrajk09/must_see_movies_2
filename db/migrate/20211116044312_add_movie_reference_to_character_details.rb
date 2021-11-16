class AddMovieReferenceToCharacterDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :character_details, :movies
    add_index :character_details, :movie_id
    change_column_null :character_details, :movie_id, false
  end
end
