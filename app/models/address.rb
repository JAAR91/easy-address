class Address < ApplicationRecord
  belongs_to :user
  
  validates :calle, presence: true
  validates :ext_number, presence: true
  validates :int_number, presence: true
  validates :postal_code, presence: true
  validates :colonia, presence: true
  validates :municipio, presence: true
  validates :estado, presence: true
  validates :pais, presence: true
end
