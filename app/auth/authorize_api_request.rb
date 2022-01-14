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
    http_auth_header = @headers['Authorization'].split.last if @headers['Authorization'].present?
    return { message: 'Missing Token!', code: 404 } unless http_auth_header
    decoded_auth_token = JsonWebToken.decode(http_auth_header)
    return { message: 'Wrong Token!', code: 404 } unless decoded_auth_token
    user = User.find(decoded_auth_token['user_id'])

    { user: user, code: 1 }
  end
end