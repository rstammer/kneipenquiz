class Team < ActiveRecord::Base

  # validations
  #
  #

  validates :title, presence: true

end
