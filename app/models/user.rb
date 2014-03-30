class User < ActiveRecord::Base

  # validations
  #
  #

  validate :not_public

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def not_public
    self.errors[:base] << "Bitte wende dich an rbn, wenn Du mitmachen willst!" if User.count > 1
  end

end
