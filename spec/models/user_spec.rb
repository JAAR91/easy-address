require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can only be one username' do
    User.create(username: 'jaar', password: "joseisj99")
    User.create(username: 'jaar', password: "joseisj99")
    expect(User.all.length).to eq(1)
  end

  it 'password is require' do
    User.create(username: 'jaar', password: "joseisj99")
    User.create(username: 'jaar', password: "")
    expect(User.all.length).to eq(1)
  end

  it 'username is require' do
    User.create(username: '', password: "joseisj99")
    expect(User.all.length).to eq(0)
  end
end
