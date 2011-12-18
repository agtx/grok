
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_lists
    make_tasks

  end
end

def make_users
 admin = User.create!(:email => "example@railstutorial.org",
                      :password => "bazbux",
                      :password_confirmation => "bazbux")
  # admin.toggle!(:admin)
  # 99.times do |n|
  #   name  = Faker::Name.name
  #   username = Faker::Internet.user_name
  #   email = "example-#{n+1}@railstutorial.org"
  #   password  = "password"
  #   User.create!(:name => name,
  #                :username => username, 
  #                :email => email,
  #                :password => password,
  #                :password_confirmation => password)
  # end
end

def make_lists
  User.all(:limit => 6).each do |user|
    50.times do
    user.lists.create!(:name => Faker::Lorem.sentence(5))
    end
  end
end

def make_tasks
  List.all(:limit => 6).each do |list|
    5.times do
      list.tasks.create!(:description => Faker::Lorem.sentence(5))
    end
  end
end
