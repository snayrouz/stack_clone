class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.integer :votable_id
      t.string :votable_type

      t.timestamps
    end
  end
end
