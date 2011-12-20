require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

desc "create current day's list for all users"
task :make_list => :environment do
  daily_list_for_users(User.all)
end
      

def daily_list_for_users(users)
  users.each do |user|
    make_list_for_today(user)
  end
end
    
