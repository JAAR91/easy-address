class JsonWebToken
  HMAC_SECRET = Rails.application.secret_key_base

  def self.encode(payload, exp = 72.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    JWT.decode(token, HMAC_SECRET)[0]
  rescue JWT::DecodeError => e
    return false
  end
end