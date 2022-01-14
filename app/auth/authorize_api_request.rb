class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def verify
    check
  end

  private

  attr_reader :headers

  def check
    return { message: 'Missing Token!', code: 404 } unless http_auth_header
    return { message: 'Wrong Token!', code: 404 } unless decoded_auth_token
    return { message: 'User not found!', code: 404 } unless user

    { user: user, code: 1 }
  end

  def user
    @user ||= User.find(decoded_auth_token['user_id']) if decoded_auth_token
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return @headers['Authorization'].split.last if @headers['Authorization'].present?
  end
end