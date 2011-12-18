class List < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user  
  has_many :tasks

  validates :name,     :presence => true
  validates :user_id, :presence => true

  default_scope :order => 'lists.created_at DESC'

end
