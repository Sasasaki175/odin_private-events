class EventsController < ApplicationController
  before_action :set_user
  before_action :set_event, only: [:show, :destroy]
  before_action :authorize_creator!, only: [:destroy]

  def index
    @events = Event.all
  end

  def show
  end
  def new
    @event = Event.new
  end

  def create
    @event = @user.created_events.build(event_params)
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    
    respond_to do |format|
      format.html { redirect_to events_path, notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_event
    @event = Event.find(params.expect(:id))
  end

  def authorize_creator!
    unless @event.creator == current_user
      redirect_to events_path, alert: "Not the creator of the event." and return
    end
  end

  def event_params
    params.expect(event: [ :name, :location, :starts_on, :private ])
  end
end
