class SessionCreationService < ApplicationService
  def self._run!(email:, password:)
    user = User.find_by(email: email)
    raise UserNotFoundError if user.blank? || !user.authenticate(password)
   
    Session.create!(user: user) 
  end
end
