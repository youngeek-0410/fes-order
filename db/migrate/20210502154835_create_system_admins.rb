class CreateSystemAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :system_admins do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.timestamps
    end
    add_index :system_admins, :email, unique: true
  end
end
