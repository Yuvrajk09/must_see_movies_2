class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.string :user_email
      t.integer :user_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
