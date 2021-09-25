class AddColumnToShops < ActiveRecord::Migration[6.0]
  def change
    change_table :shops, bulk: true do |t|
      t.boolean :initial_login, default: true, null: false
    end
  end
end
