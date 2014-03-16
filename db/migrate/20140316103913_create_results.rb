class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :round_one
      t.integer :round_two
      t.integer :round_three
      t.integer :round_four
      t.integer :total_score
      t.references :team
      t.references :game
    end
  end

  def self.down
    drop_table :results
  end
end
