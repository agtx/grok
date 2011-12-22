class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :make_list_for_today, :tommorow_date, :today_date, :current_list
  
  def make_list_for_today(user)
    @list = user.lists.create!(:name => Time.now.strftime("%A"))
  end
  
  def build_list_for_tomorrow(user)
    @tomorrow_list = user.lists.build(:name => Date.tomorrow.strftime("%A"))
  end
  
  def today_date
    Time.now.strftime("%A")
  end
  
  def tommorow_date
    Date.tomorrow.strftime("%A")
  end
  
  def current_list
    List.find_by_user_id(current_user.id)
  end
  
  
  
end
