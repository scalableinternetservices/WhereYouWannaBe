class StaticPagesController < ApplicationController
  def home
    if (!current_user.nil? && !current_user.city.nil?)
      @exclude_events = Attendee.select('event_id').where("user_id = ?",current_user.id)
      @events = Event.includes(:location).includes(:tag).joins(:location).where("date > ? AND locations.city = ? AND events.id NOT IN (?)", DateTime.now, current_user.city,@exclude_events).paginate(page: params[:page],per_page:10)
      if @events.length == 0
        @events = Event.includes(:location).includes(:tag).where("date > ? AND events.id NOT IN (?)", DateTime.now,@exclude_events).paginate(page: params[:page],per_page:10)
      end
    else
      @events = Event.includes(:location).includes(:tag).where("date > ? ", DateTime.now).paginate(page: params[:page],per_page:10)
    end
  end

  def help
  end

  def about
  end

end
