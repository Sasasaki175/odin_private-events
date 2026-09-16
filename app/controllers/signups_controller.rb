class SignupsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to Event.find(@signup.attended_event_id), notice: (@user.id == @signup.attendee_id ? "Attended event successfully." : "Invited attendant successfully.")
    else
      render root_path, status: :unprocessable_entity
    end
  end

  private
  
  def set_user
    @user = current_user
  end

  def signup_params
    params.expect(signup: [ :attendee_id, :attended_event_id ])
  end
end
