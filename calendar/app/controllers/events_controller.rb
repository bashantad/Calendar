class EventsController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  #layout "application", :except => [:show]
  #layout 'show_layout'
  before_filter :authenticate_user!
  def index
    @circle = Circle.find(params[:circle_id])
    if @circle.nil?
      @events = current_user.events
    else
      @events = @circle.events
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @event = current_user.events.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end
  # POST /tasks
  # POST /tasks.json
  def create
    @event = current_user.events.new(params[:task])

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /envets/1
  # PUT /tasks/1.json
  def update
    @event = current_user.events.find(params[:id])
    respond_to do |format|
      if @event.update_attributes(params[:task])
        format.html { redirect_to @event, notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path }
      format.js
    end
  end
  #GET /events/1
  def show
    @event = Event.find(params[:id])
    #render :nothing => true
    respond_to do |format|
     format.html{render "show", layout: false}
      format.js
    end
  end
end

