class AddExternalImageUrlToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :external_image_url, :text
  end

  def self.down
    remove_column :questions, :external_image_url
  end
end
