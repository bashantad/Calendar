class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user
  belongs_to :circle
  validates :name, :presence =>true, :format => {:with =>/^(\w|\s)*$/i}, :length => {:minimum =>4 }
  validates :description, :presence =>true, :format => {:with =>/^(\w|\s)*$/i}, :length => {:minimum =>10 }
  validates :start_at, :presence => true
  validates :end_at, :presence => true
end

