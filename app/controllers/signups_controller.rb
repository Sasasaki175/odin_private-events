class SignupsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :authorize_creator!, only: [:destroy]

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to Event.find(@signup.attended_event_id), notice: (@user.id == @signup.attendee_id ? "Attended event successfully." : "Invited attendant successfully.")
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def destroy
    @signup = Signup.find_by(signup_params)
    @signup.destroy

    respond_to do |format|
      format.html { redirect_back_or_to events_path, notice: "Your attendance has been successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_user
    @user = current_user
  end

  def signup_params
    params.expect(signup: [ :attendee_id, :attended_event_id ])
  end

  def authorize_creator!
    unless User.find(params[:signup][:attendee_id]) == current_user
      redirect_to events_path, alert: "Not the creator of the event." and return
    end
  end
end
