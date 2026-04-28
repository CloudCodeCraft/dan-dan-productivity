class PasswordNotValidError < StandardError
  def initialize(msg = 'Your password is not secure enough')
    super(msg)
  end
end
