class AddColumnToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :charge_id, :string, null: false, default: ''
  end
end
