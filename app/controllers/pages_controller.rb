class PagesController < ApplicationController
  def home
    if session[:user_id]!= nil
      redirect_to articles_path
    end
  end

  def about    
  end
end




