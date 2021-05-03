class CreataOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :count, null: false
      t.timestamps
    end
  end
end
