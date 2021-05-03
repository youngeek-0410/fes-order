class AddColumnToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :receipt, foreign_key: true
  end
end
