class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :movie_id
      t.string :movie_name
      t.string :movie_description
      t.string :movie_duration
      t.string :movie_year

      t.timestamps
    end
  end
end
