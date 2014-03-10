class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :title
      t.integer :total_score
    end
  end

  def self.down
    drop_table :teams
  end
end
