class StaticPagesController < ApplicationController

  def home
=begin
    if signed_in?
      	redirect_to current_user
    end
=end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
