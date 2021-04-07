class ApplicationController < ActionController::Base

  def authenticate
    unless signed_in?
      redirect_to new_session_path
    end
  end

  def signed_in?
    session[:current_email].present?
  end
end
