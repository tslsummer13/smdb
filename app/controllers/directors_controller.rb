class DirectorsController < ApplicationController
  before_action :find_director, :only => [:show, :edit, :update, :destroy]
  def find_director
    @director = Director.find_by_id(params[:id])
  end

  def index
    @directors = Director.all
  end

  def show
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new
    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.image_url = params[:image_url]
    @director.bio = params[:bio]

    if @director.save
      redirect_to directors_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.image_url = params[:image_url]
    @director.bio = params[:bio]

    if @director.save
      redirect_to directors_url
    else
      render 'new'
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_url
  end
end
