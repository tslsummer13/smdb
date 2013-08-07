class MoviesController < ApplicationController
  before_action :find_movie, :only => [:show, :edit, :update, :destroy]
  def find_movie
    @movie = Movie.find_by_id(params[:id])
  end

  def index
    @movies = Movie.order("title").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    if @movie.save
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    if @movie.save
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url
  end
end
