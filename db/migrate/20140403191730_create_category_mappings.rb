class CreateCategoryMappings < ActiveRecord::Migration
  def change
    create_table :category_mappings do |t|
      t.references :question
      t.references :category
    end
  end
end
