class PagesController < ApplicationController
    
  def home
    if signed_in?
      redirect_to '/lists/'
    end
  end

  def about
  end

  def help
  end


end

