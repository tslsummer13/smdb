class UsersController < ApplicationController
  before_action :find_user, :only => [:show, :edit, :update, :destroy]
  def find_user
    @user = User.find_by_id(params[:id])
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Signed up successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end
end
