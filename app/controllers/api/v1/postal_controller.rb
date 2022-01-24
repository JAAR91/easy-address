class Api::V1::PostalController < ApplicationController
  def verify
    copomex_response = Copomex.new(params[:code]).check_postal
    col = []
    copomex_response.each do |item|
      col << item["response"]["asentamiento"]
    end
    render json: {
      result: {
        "municipio" => copomex_response[0]["response"]["municipio"],
        "estado" => copomex_response[0]["response"]["estado"],
        "ciudad" => copomex_response[0]["response"]["ciudad"],
        "pais" => copomex_response[0]["response"]["pais"],
        "colonias" => col
      }
    }
    # render json: { response: params[:code] }
  end
end
