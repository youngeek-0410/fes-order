class CreataQuiz < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :description, null: false, limit: 256
      t.string :content1, null: false
      t.string :content2, null: false
      t.string :content3, null: false
      t.integer :answer, null: false
      t.timestamps
    end
  end
end
