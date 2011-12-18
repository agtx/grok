module ApplicationHelper
  
  def logo
    image_tag('logo.png', :alt => "grok", :class => "round")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def current_user?(user)
    user == current_user
  end


  
end
