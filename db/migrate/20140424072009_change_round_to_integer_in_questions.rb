class ChangeRoundToIntegerInQuestions < ActiveRecord::Migration
  def self.up
    remove_column :questions, :round, :string
    add_column :questions, :round, :integer
  end

  def self.down
    remove_column :questions, :round, :integer
    add_column :questions, :round, :string
  end
end
