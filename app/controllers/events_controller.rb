class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update,:destroy, :index,:show,:new]


  # GET /events
  # GET /events.json
  def index
    @exclude_events = Attendee.select('event_id').where("user_id = ?",current_user.id)
    if(params.has_key?(:tag_id))
      @events = Event.includes(:location)
                     .includes(:tag).where("date > ? AND tag_id = ? AND events.id NOT IN (?)", DateTime.now, params[:tag_id], @exclude_events)
                     .paginate(page: params[:page],per_page:10, total_entries: 400)
      # @events = Event.joins(:location).joins(:tag).where("date > ? AND tag_id = ? AND events.id NOT IN (?)", DateTime.now, params[:tag_id],@exclude_events)
      # .paginate(page: params[:page],per_page:10)
    elsif(params.has_key?(:location_id))
      @events = Event.includes(:location).includes(:tag).where("date > ? AND location_id = ? AND events.id NOT IN (?)", DateTime.now,
      params[:location_id],@exclude_events).paginate(page: params[:page],per_page:10, total_entries: 400)
    else
      @events = Event.includes(:location).includes(:tag).where("date > ? AND events.id NOT IN (?)", DateTime.now, @exclude_events)
                    .paginate(page: params[:page],per_page:10, total_entries: 400)
    end
    @tags = Tag.all_tags
    @locations = Location.all_locations
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comment = Comment.new
    @tag = Tag.find_by_id(@event.tag_id)
    @location = Location.find_by_id(@event.location_id)
    # @comments = Comment.includes(:user).map { |@event.comments| }
    @comments = @event.comments
    @user = User.find_by_id(@event.user_id)
    user_ids =  Attendee.joins(:event).pluck(:user_id)
    @attendee = User.where("id in (?)", user_ids)
    @event.avatar = Event.find(params[:id]).avatar
    # render :js => "window.location.href='"+events_path+"/"+params[:id] if params[:id].present?
    # respond_to do |format|
    #     format.html
    #     # format.json { render :json => { :redirect => requests_url}}
    # end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = "Event was successfully created."
        format.html { redirect_to @event }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      p "hello kichu keech"
      p event_params[:title]
      @event = Event.find(params[:id])

      p @event.errors.inspect
      if @event.update(event_params)
        flash[:success] = "Event was successfully updated!"
        format.html { redirect_to @event}
        format.json { render :show, status: :ok, location: @event }
      else
        p @event.errors.inspect
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
      p @event.errors.inspect
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      flash[:success] = "Event was successfully destroyed."
      format.html { redirect_to events_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :tag_id, :location_id, :date, :price, :user_id, :avatar)
    end
end
