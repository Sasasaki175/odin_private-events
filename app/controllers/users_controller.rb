class UsersController < ApplicationController
  def show
    @created_events = Event.where(creator: current_user)
  end
end
