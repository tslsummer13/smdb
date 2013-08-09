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
    #  Parameters: {"utf8"=>"✓", "authenticity_token"=>"rUcl+idVYqh6CXMlDgk7iHWKBAvE8O+f2MQE/p/M9BM=", "movie"=>{"title"=>"Fantastic Mr. Fox", "year"=>"", "duration"=>"", "description"=>"", "image_url"=>"", "director_id"=>"825"}, "commit"=>"Create Movie"}
    @movie = Movie.new
    @movie.title = params[:movie][:title]
    @movie.year = params[:movie][:year]
    @movie.duration = params[:movie][:duration]
    @movie.description = params[:movie][:description]
    @movie.image_url = params[:movie][:image_url]
    @movie.director_id = params[:movie][:director_id]

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
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url
  end
end
