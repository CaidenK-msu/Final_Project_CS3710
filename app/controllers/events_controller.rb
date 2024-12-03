class EventsController < ApplicationController
  before_action :require_login, except: [:index, :show] # Adjust the actions here as necessary

  def index
    @events = Event.all.order(date: :asc)
  end

  def new
    if logged_in?
      @event = current_user.events.build
    else
      redirect_to login_path, alert: "You must be logged in to create an event."
    end
  end

  def create
    if logged_in?
      @event = current_user.events.build(event_params)
      if @event.save
        redirect_to events_path, notice: "Event created successfully!"
      else
        render :new
      end
    else
      redirect_to login_path, alert: "You must be logged in to create an event."
    end
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: "Event updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully!"
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end