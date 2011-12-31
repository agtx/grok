class PagesController < ApplicationController
    
  def home
    if signed_in?
      if current_user.lists.empty?
        @list = current_user.lists.create!(:name => Date.today)
        redirect_to lists_path(:list_position => @list.position)                 
      else
        redirect_to lists_path
      end
    end
  end

  def about
  end

  def help
  end


end

