class UsersController < ApplicationController
  def show
    set_user
    @created_events = Event.where(creator: @user)
  end

  private

  def set_user
    @user = User.find(1)
  end
end
