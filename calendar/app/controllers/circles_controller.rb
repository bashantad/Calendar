class CirclesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @circles = current_user.circles
    @all_users = User.all
    respond_to do |format|
      format.html
    end  
  end
  def new
    @circle = current_user.circles.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @circle }
    end
  end
  def create
    @circle = current_user.circles.new(params[:circle])
    respond_to  do |format|
      if @circle.save
        format.html { redirect_to circles_path, notice: 'Circle was successfully created.' }
        format.js
      else
        format.html { render action: "new", notice: 'Give name and assign at least a member.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    uids = params[:circle][:user_ids]
    @new_users = User.where("id in (?)", uids)
    @circle = current_user.circles.find(params[:id])
    @circle.users << @new_users
    respond_to  do |format|
     if @circle.save
        format.html{redirect_to circles_path, notice: 'Members added successfully.'}
        format.json { head :ok }
      else
        format.html{redirect_to circles_path, notice: 'Members couldn\'t add'}
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
