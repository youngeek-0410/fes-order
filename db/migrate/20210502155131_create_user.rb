class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :display_name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :customer_id, null: false
      t.timestamps
    end
  end
end
