class StaticPagesController < ApplicationController
  def home
    @exclude_events = Attendee.select('event_id').where("user_id = ?",current_user.id)
    if (!current_user.nil? && !current_user.city.nil?)
      @events = Event.joins(:location).where("date > ? AND locations.city = ? AND events.id NOT IN (?)", DateTime.now, current_user.city,@exclude_events)
      if @events.length == 0
        @events = Event.where("date > ? AND events.id NOT IN (?)", DateTime.now,@exclude_events)
      end
    else
      @events = Event.where("date > ? AND events.id NOT IN (?)", DateTime.now,@exclude_events)
    end 
  end

  def help
  end
  
  def about
  end
  
end