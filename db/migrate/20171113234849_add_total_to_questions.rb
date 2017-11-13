class AddTotalToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :total, :integer, :default => 0
  end
end
