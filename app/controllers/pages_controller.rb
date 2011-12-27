class PagesController < ApplicationController
  
  def home
    @user = current_user
    if signed_in?  

      if @user.lists.empty?
        make_list_for_today(@user)                   
        @list = current_user.lists.find_by_id(cookies[:current_list_id])
        
      elsif current_list.nil?
        @current_list = List.default_location(@user).first
        @list = current_list
      else
        @list = current_user.lists.find_by_id(cookies[:current_list_id])
      end                                    
    end
  end

  def about
  end
  
  def show
    
  end

  def help
  end

  def back_one_list
    @current_list = current_list.higher_item
    cookies[:current_list_id] = { :value => @current_list.id, :expires => 5.minutes.from_now }
  end

end

