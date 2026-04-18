ActiveSupport::Notifications.subscribe("application_service.run") do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)

  filter = ActiveSupport::ParameterFilter.new(
    Rails.application.config.filter_parameters
  )

  filtered_kwargs = filter.filter(event.payload[:kwargs] || {})

  if event.payload[:exception]
    exception_class, exception_message = event.payload[:exception]

    Rails.logger.error(
      "[Service] #{event.payload[:service]} " \
      "FAILED in #{event.duration.round(2)}ms " \
      "kwargs=#{filtered_kwargs.inspect} " \
      "error=#{exception_class}: #{exception_message}"
    )
  else
    Rails.logger.info(
      "[Service] #{event.payload[:service]} " \
      "SUCCEEDED in #{event.duration.round(2)}ms " \
      "kwargs=#{filtered_kwargs.inspect}"
    )
  end
end
