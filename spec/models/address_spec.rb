require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'a user have many addresses' do
    user = User.create(username: 'jaar', password: "joseisj99")
    user.addresses.create(calle: "calle test", ext_number: "1", int_number: "1", postal_code: "12345", colonia: "col test", municipio: "tested", estado: "dc", pais: "mexico")
    user.addresses.create(calle: "calle test", ext_number: "1", int_number: "1", postal_code: "12345", colonia: "col test", municipio: "tested", estado: "dc", pais: "mexico")
    user.addresses.create(calle: "calle test", ext_number: "1", int_number: "1", postal_code: "12345", colonia: "col test", municipio: "tested", estado: "dc", pais: "mexico")
    user.addresses.create(calle: "calle test", ext_number: "1", int_number: "1", postal_code: "12345", colonia: "col test", municipio: "tested", estado: "dc", pais: "mexico")
    user.addresses.create(calle: "calle test", ext_number: "1", int_number: "1", postal_code: "12345", colonia: "col test", municipio: "tested", estado: "dc", pais: "mexico")
    expect(user.addresses.length).to eq(5)
  end
end
