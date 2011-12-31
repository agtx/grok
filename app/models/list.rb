class List < ActiveRecord::Base

  attr_accessible :name, :user_id
  belongs_to :user  
    acts_as_list :scope => :user
  has_many :tasks

  validates :name,     :presence => true
  validates :user_id,  :presence => true
  
  scope :default_location, lambda { |user| find_today(user).where(:user_id => user.id) }
  
  def self.find_today(user)
    made_this_week = user.lists.where("lists.created_at >= ? AND lists.created_at <= ?", 
                       DateTime.now.beginning_of_week, DateTime.now.end_of_week).limit(1)
    todayslist = made_this_week.where(:name => Date.today)
  end


  
end
