class ChangeColumnInReceipt < ActiveRecord::Migration[6.0]
  def change
    remove_column :receipts, :order_id
    change_column_null :receipts, :coupon_id, true
  end
end
