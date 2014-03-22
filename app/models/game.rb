class Game < ActiveRecord::Base

  has_many :results
  has_many :questions

end

