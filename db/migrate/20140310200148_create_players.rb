class CreatePlayer < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.string :email
    end
  end

  def self.down
    drop_table :players
  end
end
