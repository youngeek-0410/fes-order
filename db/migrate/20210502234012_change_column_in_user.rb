class ChangeColumnInUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :customer_id, true
  end
end
