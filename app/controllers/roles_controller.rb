class RolesController < ApplicationController
  before_action :find_role, :only => [:show, :edit, :update, :destroy]
  def find_role
    @role = Role.find_by_id(params[:id])
  end

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new
    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    if @role.save
      redirect_to roles_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    if @role.save
      redirect_to roles_url
    else
      render 'new'
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_url
  end
end
