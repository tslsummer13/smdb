class ActorsController < ApplicationController
  before_action :find_actor, :only => [:show, :edit, :update, :destroy]
  def find_actor
    @actor = Actor.find_by_id(params[:id])
  end

  def index
    @actors = Actor.all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new
    @actor.name = params[:name]
    @actor.dob = params[:dob]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    if @actor.save
      redirect_to actors_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @actor.name = params[:name]
    @actor.dob = params[:dob]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    if @actor.save
      redirect_to actors_url
    else
      render 'new'
    end
  end

  def destroy
    @actor.destroy
    redirect_to actors_url
  end
end
