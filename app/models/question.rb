class Question < ActiveRecord::Base

  TYPES = [
    'normal', 'Multiple-Choice', 'Schätzfrage',
    'Worträtsel', 'Bilderrätsel', 'Musik'
  ]

  # associations
  #
  #

  belongs_to :game
  has_many :category_mappings

  # validations
  #
  #

  validates :content, :answer, :typus, presence: true

  # meta programming
  #
  #

  acts_as_taggable

end
