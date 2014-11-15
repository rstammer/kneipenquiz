class PublicController < ActionController::Base

  layout 'application'

  def reglement
  end

  def start
    @post = Post.last
  end

end
