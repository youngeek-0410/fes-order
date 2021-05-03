class ChangeColumnInReceipt < ActiveRecord::Migration[6.0]
  def change
    change_column_null :receipts, :coupon_id, true
  end
end
