# the philosophy here is that services are units of tasks
# where each task is broken into 1 action it does
# it has a simple API, adding in key word arguments
# and then run it. If you find that your run
# function is becoming a large collection of logic 
# it is a sign that the run method should be broken into
# smaller servies. All business domain logic is a collection of
# tasks that MUST be broken into digestable / debuggale parts
# making the service here a way to enforce/recommend that
# all subclasses programmers just defines 1 class method called #_run! and
# that's the only method the subclasses can have
# also if for instance one needs to validate and transform the args given to run
# that should be done in another service with this naming convention
# for example if you have a UserSignupService that writes the user to the database 
# but you want to verify password and username requirements you would create a UserCredentialsVerifierService 
# and call the UserSignupService like so (an example):
# ```
# begin
# UserSignupService.run!(
#   credentials: UserCredentialsVerifierService.run!(
#       username: '<SOME_ARG>', 
#       password: '<SOME_ARG>'
#    )
# )
# rescue ....
# end
# ```
#
# note that #run should raise an exception, ideally a custom made exception
# the custom errors should not reference that the error is specific to a service
# but the error should represent a domain error, like PasswordTooShortError
class ApplicationService
  class << self
    def inherited(subclass)
      super

      subclass.instance_variable_set(:@_defined_run, false)

      subclass.singleton_class.define_method(:method_added) do |method_name|
        if method_name != :_run!
          raise "#{subclass} can only define ._run!, not .#{method_name}"
        end

        if @_defined_run
          raise "#{subclass} can only define ._run! once"
        end

        @_defined_run = true
      end

      subclass.define_singleton_method(:method_added) do |method_name|
        raise "#{subclass} cannot define instance methods (tried ##{method_name})"
      end
    end

    def run!(**kwargs)
      unless singleton_class.method_defined?(:_run!)
        raise NotImplementedError, "#{name} must implement ._run!"
      end

      kwargs = kwargs.dup.freeze

      ActiveSupport::Notifications.instrument(
        "application_service.run",
        service: name,
        kwargs: kwargs
      ) do
        _run!(**kwargs)
      end
    end
  end

  def new(*)
    raise "#{self} cannot be instantiated. Use .run! instead."
  end
end
