class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :make_list_for_today
  
  def make_list_for_today(user)
    @list = user.lists.create!(:name => Time.now.strftime("%A"))
  end
  
  def build_list_for_tomorrow(user)
    @tomorrow_list = user.lists.build(:name => Date.tomorrow.strftime("%A"))
  end
  
  def current_list
    current_user.lists.find(session[:list_id])
  end
  
  def current_list=(list)
    session[:list_id] = list.try(:id)
  end
  
end
