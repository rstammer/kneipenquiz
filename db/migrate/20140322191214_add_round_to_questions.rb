class AddRoundToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :round, :string
  end
end
