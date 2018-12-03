class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update,:destroy, :index,:show,:new]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    p "HELLO !!!!!!!!!!!!!!!!!!"
    p params
    # params = params[:data]
    # p params
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        # format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: 200 }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @event = Event.find_by_id(@comment.event_id)
    @comment.destroy
    p "##############"
    p params
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Comment was successfully destroyed.'}
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:message, :event_id, :user_id, :date)
    end
end
