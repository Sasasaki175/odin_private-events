class SignupsController < ApplicationController
  def create
    set_user
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to Event.find(@signup.attended_event_id), notice: "Attended event successfully."
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
