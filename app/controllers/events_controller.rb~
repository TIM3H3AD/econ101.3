class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
      @event = current_user.created_events.build(event_params)
      if @event.save
      flash[:success] = "You have added a new Event!"
      redirect_to @event #things_path later
    else
      flash[:danger] = "The form contains errors"
      render :new
    end
  end

  def index
  @events = current_user.events
  end

  def show
  @event = Event.find(params[:id])
  end

  def edit
  @user = current_user
  @event = Event.find(params[:id])
  end

  def update
  @user = current_user
  @event = Event.find(params[:id])  
  if @event.update_attributes(event_params)
      flash[:success] = "Update successful"
      redirect_to @event
    else
      flash[:danger] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    if @event.destroy
      flash[:success] = "Your Event was deleted successfully"
      redirect_to root_url
    else
      flash[:danger] = "Could not delete"
      render @event
    end
  end

  private

  def event_params
    params.require(:event).permit(:creator_id, :image, :hashtags, :title, :description, :the_day, :the_time, :location, :location_street_number, :location_street_name, :location_zip, :url_link, :meme_addy)
  end

  def correct_user
  @event = Event.find(params[:id])
    if current_user != @event.creator
      flash[:danger] = "You don't have permission to do that."
      redirect_to root_url
    end
  end
end
