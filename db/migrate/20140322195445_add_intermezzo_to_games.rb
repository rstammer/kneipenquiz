class AddIntermezzoToGames < ActiveRecord::Migration
  def change
    add_column :games, :intermezzo, :text
  end
end
