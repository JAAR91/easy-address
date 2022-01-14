class ApplicationController < ActionController::Base
  private

  def authorize_request
    status = AuthorizeApiRequest.new(request.headers).verify
    if status[:code] == 1
      @current_user = status[:user]
    else
      render json: status
    end
    nil
  end
end
