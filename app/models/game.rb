class Game < ActiveRecord::Base

  # associations
  #
  #

  has_many :results
  has_many :questions

end

