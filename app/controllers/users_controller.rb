class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index 
    @users = User.all
    @event = Event.find_by(id: params.expect(:event_id))
  end

  def show
    @created_events = Event.where(creator: @user)
  end

  private

  def set_user
    @user = current_user
  end
end
