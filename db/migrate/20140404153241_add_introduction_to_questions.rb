class AddIntroductionToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :introduction, :text
  end

  def self.down
    remove_column :questions, :introduction
  end
end
