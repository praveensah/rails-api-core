module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end

    rescue_from Exception do |e|
      logger.error("Error Occured: #{e.message}")
      logger.error("Error Backtrace: #{e.backtrace.join("\n")}")
      json_response({ message: e.message }, 500)
    end

  end
end