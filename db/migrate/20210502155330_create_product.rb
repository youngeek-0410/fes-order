class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false, limit: 256
      t.integer :price, null: false
      t.integer :price_tax, null: false
      t.timestamps
    end
  end
end
