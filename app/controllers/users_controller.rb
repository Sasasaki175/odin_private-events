class UsersController < ApplicationController
  def index 
    @users = User.all
    @event = Event.find(params[:event_id])
  end
  def show
    set_user
    @created_events = Event.where(creator: @user)
  end

  private

  def set_user
    @user = current_user
  end
end
