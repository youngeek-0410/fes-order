class CreateShop < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :name, null: false
      t.text :description, limit: 256
      t.timestamps
    end
  end
end
