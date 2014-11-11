class ChangeRoundScoreColumnsToFloat < ActiveRecord::Migration
  def change
    change_column :results, :round_one, :float
    change_column :results, :round_two, :float
    change_column :results, :round_three, :float
    change_column :results, :round_four, :float
    change_column :results, :total_score, :float
    change_column :teams, :total_score, :float
  end
end
