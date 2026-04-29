class UserCreationService < ApplicationService
  def self._run!(email:, password:, password_confirmation:)
    raise EmailAlreadyInUseError if User.find_by(email: email).present?
    raise EmailNotValidError unless email.match?(URI::MailTo::EMAIL_REGEXP)
    raise PasswordsDoNotMatchError if password != password_confirmation
    raise PasswordNotValidError, 'Password is too short' if password.length < 8

    User.create!(email: email, password: password, password_confirmation: password_confirmation)
  end
end
