class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.string :user_id, null: false
      t.string :response, null: false
    end
  end
end
