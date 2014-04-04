class CategoryMapping < ActiveRecord::Base

  # associations
  #
  #

  belongs_to :question
  belongs_to :category

end
