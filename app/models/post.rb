class Post < ActiveRecord::Base

  # validations
  #
  #

  validates :title, presence: true

end
