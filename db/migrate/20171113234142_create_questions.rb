class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.text :text, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
