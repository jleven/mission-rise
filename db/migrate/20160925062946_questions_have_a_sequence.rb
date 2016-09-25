class QuestionsHaveASequence < ActiveRecord::Migration
  def up
    Question.delete_all
    add_column :questions, :name, :string
    change_column :questions, :name, :string, null: false
    add_index :questions, :name, unique: :true
  end

  def down
    remove_column :questions, :name
  end
end
