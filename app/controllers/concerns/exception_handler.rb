module ExceptionHandler

  extend ActiveSupport::Concern
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::ExpiredSignature, with: :four_ninety_eight

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message  }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message  }, :unprocessable_entity)
    end
  end

  private
  #JSON response with 422 - unprocessable entity
  def four_twenty_two(e)
    json_response({ message: e.message  }, :unprocessable_entity)
  end

  # status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message  }, :unauthorized)
  end
end
