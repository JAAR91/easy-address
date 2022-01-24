class Api::V1::AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authorize_request

  def index
    render json: {
      addresses:  @current_user.addresses.all
    }
  end

  def create
    @address = Address.new(body_address)
    if @address.save
      render json: { message: 'New address created' }, :status => 200
    else
      render json: { message: @address.errors.messages }, :status => 409
    end
  end

  def delete
    address = Address.find_by(id: params[:id])
    if address.blank?
      render json: { message: "Address does not exist!"}, :status => 404
    else
      address.destroy
      render json: { message: "Address has been deleted!"}, :status => 200
    end
  end

  def update
    address = Address.find_by(id: params[:id])
    if address.blank?
      render json: { message: "Address does not exist!"}, :status => 404
    elsif address.update(body_address)
      render json: { message: "Address has been updated!"}, :status => 200
    else
      render json: { message: "Unable to update address!"}, :status => 409
    end
  end

  private

  def body_address
    body_object = params.permit(:calle, :ext_number, :int_number, :postal_code, :colonia, :municipio, :estado, :pais )
    body_object["user_id"] = @current_user.id
    body_object
  end
  
end
