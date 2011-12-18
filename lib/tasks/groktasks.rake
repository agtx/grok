
desc "create current day's list for all users"
task :make_list => :environment do
  daily_list_for_users(users)
end
      
      
def users
  User.all
end

def daily_list_for_users(users)
  users.each do |user|
    user.lists.create!(:name => Time.now.strftime("%A"))
  end
end
    
