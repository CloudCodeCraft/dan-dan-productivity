class EmailAlreadyInUseError < StandardError
  def initialize(msg = 'Email already in use')
    super(msg)
  end
end
