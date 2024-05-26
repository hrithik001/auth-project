class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
