class Question < ActiveRecord::Base

  # validations
  #
  #

  validates :content, :answer, presence: true

end
