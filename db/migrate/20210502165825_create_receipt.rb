class CreateReceipt < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :price_tax, null: false
      t.boolean :is_used, null: false, default: false
      t.timestamps
    end
  end
end
