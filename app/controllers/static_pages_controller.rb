class StaticPagesController < ApplicationController
  def home
    if (!current_user.nil? && !current_user.city.nil?)
      @events = Event.joins(:location).where("date > ? AND locations.city = ?", DateTime.now, current_user.city)
      if @events.length == 0
        @events = Event.where("date > ?", DateTime.now)
      end
    else
      @events = Event.where("date > ?", DateTime.now)
    end
  end

  def help
  end
  
  def about
  end
  
end