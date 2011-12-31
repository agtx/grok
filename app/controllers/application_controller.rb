class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_list, :current_list=


  def after_sign_in_path_for(resource)
   return request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end  
  
  def current_list=(list)
   @current_list = list   
    cookies[:current_list_id] = { :value => list.id, :expires => 5.minutes.from_now }
  end

  def current_list
    @current_list ||= current_user.lists.find_by_id(session[:current_list_id])
  end

    # 
    # def default_location?(user, list)
    #   list == List.default_location(user)
    # end
  
end
