class AddTotalToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :total, :integer, :default => 0
  end
end
