class AuthenticateUser
  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private
  attr_reader :name, :email, :password

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
