class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :prompt, null: false
      t.text :meta
      t.string :kind
    end
  end
end
