class SignupsController < ApplicationController
  def create
    set_user
    @signup = Signup.create(signup_params)
  end

  private
  
  def set_user
    @user = User.find(1)
  end

  def signup_params
    params.expect(signup: [ :attendee_id, :attended_event_id ])
  end
end
