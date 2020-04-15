# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  class Forbidden < ActionController::ActionControllerError
  end

    rescue_from Exception, with: :internal_server_error
    rescue_from Forbidden, with: :forbidden
    rescue_from ActionController::RoutingError, with: :not_found
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def forbidden
    render 'errors/forbidden', status: :forbidden
  end

  def not_found
    render 'errors/not_found', status: :not_found
  end

  def internal_server_error
    render '/errors/internal_server_error', status: :internal_server_error
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
