class PostEventsController < ApplicationController
  before_action :set_post_event, only: [:show, :edit, :update, :destroy]

  # GET /post_events
  # GET /post_events.json
  def index
    @post_events = PostEvent.all
  end

  # GET /post_events/1
  # GET /post_events/1.json
  def show
  end

  # GET /post_events/new
  def new
    @post_event = PostEvent.new
  end

  # GET /post_events/1/edit
  def edit
  end

  # POST /post_events
  # POST /post_events.json
  def create
        @content = "【" + params[:title] + "】" + params[:time] + " 于\n" + params[:campus] + "校区" + params[:building] + params[:detail_place] +
"\n" + " 说明: " + params[:description]
    #@post_event = PostEvent.new(post_event_params)
=begin
    respond_to do |format|
      if @post_event.save
        format.html { }#redirect_to @post_event, notice: 'Post event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_event.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /post_events/1
  # PATCH/PUT /post_events/1.json
  def update
    respond_to do |format|
      if @post_event.update(post_event_params)
        format.html { redirect_to @post_event, notice: 'Post event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_events/1
  # DELETE /post_events/1.json
  def destroy
    @post_event.destroy
    respond_to do |format|
      format.html { redirect_to post_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_event
      @post_event = PostEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_event_params
      params[:post_event]
    end
end
