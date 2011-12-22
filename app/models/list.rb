class List < ActiveRecord::Base

  attr_accessor :id
  attr_accessible :name, :user_id
  belongs_to :user  
    acts_as_list :scope => :user
  has_many :tasks

  validates :name,     :presence => true
  validates :user_id,  :presence => true

  scope :made_this_week, where("created_at >= ? AND created_at <= ?", 
                               DateTime.now.beginning_of_week, DateTime.now.end_of_week)

  def self.default_location
    @list = List.made_this_week.find_by_name(Time.now.strftime("%A"))
    
  end
  
  
end
