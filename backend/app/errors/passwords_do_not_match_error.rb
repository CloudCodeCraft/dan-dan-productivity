class PasswordsDoNotMatchError < StandardError
  def initialize(msg = 'Passwords do not match')
    super(msg)
  end
end
