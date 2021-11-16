class CreateReviewDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :review_details do |t|
      t.integer :movie_id
      t.string :review
      t.string :star_ratings
      t.integer :user_id

      t.timestamps
    end
  end
end
