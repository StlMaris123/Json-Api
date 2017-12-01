module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    resque_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    resque_from ActiveRecord::RecordInvalid do |e|
      json_response({message: e.message}, :unprocessed_entity)
    end
  end
end
