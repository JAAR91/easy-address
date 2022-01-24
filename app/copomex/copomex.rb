class Copomex
  def initialize(postal_code)
    @postal_code = postal_code
  end

  def check_postal
    url = "https://api.copomex.com/query/info_cp/" + @postal_code + "?token=pruebas"
    response = RestClient.get url
    JSON.parse response.to_str
  end

  def test
    "this is a test"
  end
end