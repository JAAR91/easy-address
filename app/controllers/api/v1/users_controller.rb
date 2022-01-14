class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if check_params
      render json: { message: 'Username or password cant be empty', code: 204 }
    elsif check_user
      render json: { message: 'User already exist', code: 204 }
    else
      @user = User.new(body_params)
      if @user.save
        token = AuthenticateUser.new(body_params[:username], body_params[:password]).call
        token['message'] = 'User Created Succesfuly!'
        token['code'] = 200
        render json: token
      else
        #render json: { message: 'User is already in use', code: 409 }
        render json: { message: body_params[:username], code: 409 }
      end
    end
  end

  def login
    if check_params
      render json: { message: 'User or password cant be empty', code: 204 }
    else
      @user = User.find_by(username: body_params[:username])
      if @user && (@user.password == body_params[:password])
        token = AuthenticateUser.new(body_params[:username], body_params[:password]).call
        token['message'] = 'Logged in Succesfuly!'
        token['code'] = 200
        render json: token, :status => 200
      else
        render json: { message: 'User or password incorrect', code: 201 }, :status => 201
      end
    end
  end

  private

  def check_user
    return false if  User.find_by(username: body_params[:username]).nil?
    true
  end

  def check_params
    return true if (body_params[:username] == '' || body_params[:username].nil?)
    return true if (body_params[:password] == '' || body_params[:password].nil?)
    false
  end

  def body_params
    params.permit(:username, :password)
  end
end
