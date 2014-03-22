class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.datetime :expected_date
    end
  end

  def self.down
    drop_table :games
  end
end
