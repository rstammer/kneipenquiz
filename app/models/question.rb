class Question < ActiveRecord::Base

  # associations
  #
  #

  belongs_to :game

  # validations
  #
  #

  validates :content, :answer, presence: true

end
