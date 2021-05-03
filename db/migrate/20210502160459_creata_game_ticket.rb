class CreataGameTicket < ActiveRecord::Migration[6.0]
  def change
    create_table :game_tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_used, null: false, default: false
      t.timestamps
    end
  end
end
