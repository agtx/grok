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

  #A repulsive duplication from ApplicationController in order to "help" the rake task (instead of 
  #adding a "require ApplicationHelper" to the controller which is even worse!). To be fixed!
  def make_list_for_today(user)
    user.lists.create!(:name => Time.now.strftime("%A"))
    @list = user.lists.build(:name => Time.now.strftime("%A"))
  end


  
end
