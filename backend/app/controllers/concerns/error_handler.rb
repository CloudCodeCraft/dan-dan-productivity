module ErrorHandler
  extend ActiveSupport::Concern

  ERROR_STATUS_MAP = {
    ActiveRecord::RecordNotFound => :not_found,
    ActiveRecord::RecordInvalid => :unprocessable_entity,
    ActiveRecord::RecordNotSaved => :unprocessable_entity,
    ActiveRecord::RecordNotUnique => :unprocessable_entity,
    EmailAlreadyInUseError => :unprocessable_entity,
    PasswordNotValidError => :unprocessable_entity,
    PasswordsDoNotMatchError => :unprocessable_entity,
    UserNotFoundError => :unprocessable_entity,
    ActionController::ParameterMissing => :bad_request,

    ArgumentError => :bad_request,
    JSON::ParserError => :bad_request
  }.freeze

  included do
    rescue_from StandardError do |e|
      log_exception(e)

      render json: {
        error_class: e.class.to_s,
        error_message: error_message_for(e)
      }, status: status_for(e)
    end
  end

  private

  def status_for(exception)
    ERROR_STATUS_MAP.each do |klass, status|
      return status if exception.is_a?(klass)
    end

    raise "Unmapped error: #{exception.class}" if Rails.env.development?

    :internal_server_error
  end

  def error_message_for(exception)
    if exception.is_a?(ActiveRecord::ActiveRecordError)
      debugger
      exception.record.errors.full_messages.join(", ")
    else
      exception.message
    end
  end

  def log_exception(exception)
    Rails.logger.error("[ERROR] #{exception.class}: #{exception.message}")

    tagged_backtrace(exception).each do |line|
      Rails.logger.error(line)
    end
  end

  def tagged_backtrace(exception)
    exception.backtrace.map do |line|
      if line.include?("/backend/")
        "[APP]   #{line.split('/backend/').last}"
      elsif line.include?("/gems/")
        "[GEM]   #{line.split('/gems/').last}"
      else
        "[RUBY]  #{line}"
      end
    end
  end
end
