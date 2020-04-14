module ErrorHandlers
  extend ActiveSupport::Concern

  class Forbidden < ActionController::ActionControllerError
  end

  included do
    rescue_from Exception, with: :internal_server_error
    rescue_from Forbidden, with: :forbidden
    rescue_from ActionController::RoutingError, with: :not_found
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  end

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
end
