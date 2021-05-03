class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :required_minutes, :integer, null: false, default: 3
  end
end
