class AddScoresToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :scores, :hstore
  end

  def self.down
    remove_column :results, :scores
  end
end
