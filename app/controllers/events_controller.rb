class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params.expect(:id))
  end
  def new
    @event = Event.new
  end

  def create
    set_user
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

  private

  def set_user
    @user = User.find(1)
  end
  def event_params
    params.expect(event: [ :name, :location, :starts_on ])
  end
end
