class CreatePermissionRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :permission_requests do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :sender_contact_number
      t.string :reason_for_modification
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
