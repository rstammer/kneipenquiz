class Team < ActiveRecord::Base

  # associations
  #
  #

  has_many :players

  # validations
  #
  #

  validates :title, presence: true

end
