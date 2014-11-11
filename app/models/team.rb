class Team < ActiveRecord::Base

  # associations
  #
  #

  has_many :results

  # validations
  #
  #

  validates :title, presence: true

end
