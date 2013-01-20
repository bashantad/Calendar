class CalendarController < ApplicationController
  before_filter :authenticate_user!
  def index
    @month = (params[:month] || Time.now.month).to_i
    @year = (params[:year] || Time.now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @circles = current_user.circles
    circle_ids = @circles.collect(&:id)
    @event_strips = current_user.events.event_strips_for_month(@shown_month).to_a
    @circle_events = Event.where("circle_id in (?)", circle_ids)
    @circle_events.each do |event|
     for i in 1..30 do
      day =  event.start_at.day
      if i == day
       @event_strips[0][i-1] = event
       break
      end
    end
   end
  end
end

