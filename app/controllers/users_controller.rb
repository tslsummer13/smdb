class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Signed up successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
