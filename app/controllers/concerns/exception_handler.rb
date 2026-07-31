module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from StandardError, with: :render_internal_server_error

    # Catch specific common Rails exceptions
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActionController::ParameterMissing, ActionDispatch::Http::Parameters::ParseError, with: :render_bad_request
  end

  private

  def render_not_found(exception)
    render_error(exception.message, :not_found)
  end


  def render_unprocessable_entity(exception)
    # Provides detailed validation errors if it's an ActiveRecord validation failure
    debugger
    errors = exception.record&.errors&.as_json || exception.message
    render json: { errors: errors }, status: :unprocessable_entity
  end


  def render_bad_request(exception)
    render_error(exception.message, :bad_request)
  end

  def render_internal_server_error(exception)
    # can log error here to EFK or something maybe i dont know
    message = Rails.env.production? ? "Something went wrong" : exception.message
    render_error(message, :internal_server_error)
  end

  def render_error(message, status)
    render json: { error: message }, status: status
  end
end
