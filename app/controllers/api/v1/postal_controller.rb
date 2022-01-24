class Api::V1::PostalController < ApplicationController
  before_action :authorize_request

  def verify
    copomex_response = Copomex.new(params[:code]).check_postal
    col = []
    copomex_response.each do |item|
      col << item["response"]["asentamiento"]
    end
    if copomex_response[0]["error"]
      render json: {
        "codigo error" => copomex_response[0]["code_error"],
        "mensaje" => copomex_response[0]["error_message"]
      }, status: copomex_response[0]["code_error"]
    else
      render json: {
        "municipio" => copomex_response[0]["response"]["municipio"],
        "estado" => copomex_response[0]["response"]["estado"],
        "ciudad" => copomex_response[0]["response"]["ciudad"],
        "pais" => copomex_response[0]["response"]["pais"],
        "colonias" => col
      }, status: 200
    end
  end
end
