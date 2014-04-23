class CategoryMapping < ActiveRecord::Base

  # associations
  #
  #

  belongs_to :question
  belongs_to :category

  # class methods
  #
  #

  def self.map(question, title)
    category = Category.where(title: title).first
    if category
      category_mappings = CategoryMapping.where(category_id: category.id, question_id: question.id)
      category_mappings.first || CategoryMapping.create(category_id: category.id, question_id: question.id)
    end
  end

  def self.unmap(question, title)
    category = Category.where(title: title).first
    if category
      category_mappings = CategoryMapping.where(category_id: category.id, question_id: question.id)
      category_mappings.destroy_all
    end
  end

end
