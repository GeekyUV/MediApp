class PagesController < ApplicationController
  def home
    if user_signed_in?
      if current_user.doctor?
        @message = "Welcome, Doctor!"
        @patients = Patient.all
        render :home
      else
        @message = "Welcome, Receptionist!"
        render :home
      end
    else
      # Redirect unauthenticated users to the login page
      redirect_to new_user_session_path
    end
  end

end
