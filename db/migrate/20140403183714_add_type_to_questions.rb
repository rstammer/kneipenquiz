class AddTypeToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :typus, :string
  end

  def self.down
    remove_column :questions, :typus
  end
end
