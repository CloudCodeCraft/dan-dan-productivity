class EmailNotValidError < StandardError
  def initialize(msg = "Not a valid email")
    super(msg)
  end
end
