class UsersController < ApplicationController
  def index
    if params[:query].nil? || params[:query][:username].blank?
      render json: User.all
    else
      params[:query][:username] = '%' + params[:query][:username] + '%'
      users = User.where('username LIKE ?',params.require(:query).permit(:username)[:username])
      render json: users
    end
  end


  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    if User.update(params[:id],user_params)
      @user = User.find(params[:id])
      render json: @user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      render json: User.all
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

private
  def user_params
    params.require(:user).permit(:username)
  end
end
