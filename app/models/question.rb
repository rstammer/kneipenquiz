class Question < ActiveRecord::Base

  TYPES = [
    'normal', 'Multiple-Choice', 'Schätzfrage', 'Worträtsel',
    'Bilderrätsel', 'Musik'
  ]

  # associations
  #
  #

  belongs_to :game

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true


end
