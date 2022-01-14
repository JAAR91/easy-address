class AuthenticateUser
  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    { token: JsonWebToken.encode(user_id: user.id) } if user
  end

  private

  attr_reader :username

  def user
    user = User.find_by(username: @username)
    return user if user.password = @password

    render json: { message: 'User does not exist or worong password!', code: 404 }
  end
end