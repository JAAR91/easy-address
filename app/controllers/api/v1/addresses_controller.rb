class Api::V1::AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authorize_request

  def index
    addresses = @current_user.addresses.all
    render json: {
      addresses: addresses
    }
  end

  def create
    if check_body
      render json: { message: 'No field can be empty', code: 204 }, :status => 401
    else
      @address = Address.new(body_address)
      if @address.save
        render json: { message: 'New address created', code: 204 }, :status => 200
      else
        render json: { message: 'Could not save address', code: 204 }, :status => 409
      end
    end
  end

  def update
    address = Address.find_by(id: params[:id])
    if address.nil?
      render json: { message: "Address does not exist!"}, :status => 404
    elsif address.update(body_address)
      render json: { message: "Address has been updated!"}, :status => 200
    else
      render json: { message: "Unable to update address!"}, :status => 409
    end
  end

  private

  def check_body
    return true if body_address[:user_id] == "" || body_address[:user_id].nil?
    return true if body_address[:calle] == "" || body_address[:calle].nil?
    return true if body_address[:ext_number] == "" || body_address[:ext_number].nil?
    return true if body_address[:int_number] == "" || body_address[:int_number].nil?
    return true if body_address[:postal_code] == "" || body_address[:postal_code].nil?
    return true if body_address[:colonia] == "" || body_address[:colonia].nil?
    return true if body_address[:municipio] == "" || body_address[:municipio].nil?
    return true if body_address[:estado] == "" || body_address[:estado].nil?
    return true if body_address[:pais] == "" || body_address[:pais].nil?
    false
  end

  def body_address
    params.permit(:user_id, :calle, :ext_number, :int_number, :postal_code, :colonia, :municipio, :estado, :pais )
  end
  
end
