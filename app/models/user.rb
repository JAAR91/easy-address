class User < ApplicationRecord
  has_many :addresses
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
