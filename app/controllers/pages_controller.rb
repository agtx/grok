class PagesController < ApplicationController
  
  def home
    @user = current_user
    if signed_in?  
      @list = (current_user.lists.any?) ? current_user.lists.first : 
                                          make_list_for_today(@user)
    end
  end

  def about
  end
  
  def show
    
  end

  def help
  end

end

