class AddCorrectAnswerToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :correct_answer, :integer, :default => nil
  end
end
