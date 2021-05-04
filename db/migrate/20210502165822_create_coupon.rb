class CreateCoupon < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :discount, null: false
      t.boolean :is_used, null: false, default: false
      t.datetime :expired_at, null: false
      t.references :shop, null:false, foreign_key: true
      t.timestamps
    end
  end
end
