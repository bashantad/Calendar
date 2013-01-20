class Circle < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :events
  validates :name, :presence =>true, :length => {:minimum =>2 }, :format => {:with =>/^(\w|\s)*$/i}
  validates :user_ids, :presence => true 
  # validates :user_ids, :presence => true
end
