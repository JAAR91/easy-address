class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(body_params)
    if @user.save
      token = AuthenticateUser.new(body_params[:username], body_params[:password]).call
      render json: { token: token, message: 'User Created Succesfuly!' }, :status => 200
    else
      render json: { message: @user.errors.messages }, :status => 409
    end
  end

  def login
    if check_params
      render json: { message: 'User or password cant be empty'}, :status => 401
    else
      @user = User.find_by(username: body_params[:username])
      if @user && (@user.password == body_params[:password])
        token = AuthenticateUser.new(body_params[:username], body_params[:password]).call
        render json: { token: token, message: 'Logged in Succesfuly!'}, :status => 200
      else
        render json: { message: 'User or password incorrect', code: 201 }, :status => 409
      end
    end
  end

  private

  def check_params
    return true if (body_params[:username] == '' || body_params[:username].nil?)
    return true if (body_params[:password] == '' || body_params[:password].nil?)
    false
  end

  def body_params
    params.permit(:username, :password)
  end
end
