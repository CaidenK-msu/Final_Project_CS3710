class EventsController < ApplicationController
  before_action :require_login, except: [:index, :show] # Adjust the actions here as necessary
  
  
  before_action :set_event, only: %i[edit update show destroy]

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
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
    end


  def edit
    # @event should already be set by the before_action
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])  # Finds the event based on the ID passed in the URL
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end