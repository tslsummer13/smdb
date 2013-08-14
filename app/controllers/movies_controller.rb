class MoviesController < ApplicationController
  before_action :find_movie, :only => [:show, :edit, :update, :destroy]

  def find_movie
    @movie = Movie.find_by_id(params[:id])
  end

  #  SELECT ....
  #  INSERT ....
  #  DELETE ....
  #  CREATE_TABLE ...
  #  DROP_TABLE ...

  "SELECT * FROM MOVIES WHERE TITLE = 'Apollo 13'; DROP_TABLE ACTORS;"



  def index

    @sort_direction = params[:sort] || 'asc'

    # { "search_term" => "Apollo 13; DROP TABLE MOVIES;"}
    if params[:search_term].present?
      # SELECT * FROM MOVIES WHERE TITLE LIKE 'Apollo13'; DROP TABLE MOVIES'
      @movies = Movie.where("title LIKE ?", "%#{params[:search_term]}%")
      @movies = @movies.order("LOWER(title) #{@sort_direction}")
      @movies = @movies.page(params[:page]).per(10)
    else
      @movies = Movie.order("LOWER(title) #{@sort_direction}").page(params[:page]).per(10)
    end

    if @sort_direction == 'asc'
      @sort_direction = 'desc'
    else
      @sort_direction = 'asc'
    end
  end

  def show
    @review = Review.new
    @review.movie_id = @movie.id
  end

  def new
    @movie = Movie.new
  end

  def create
    #  Parameters: {"utf8"=>"✓", "authenticity_token"=>"rUcl+idVYqh6CXMlDgk7iHWKBAvE8O+f2MQE/p/M9BM=", "movie"=>{"title"=>"Fantastic Mr. Fox", "year"=>"", "duration"=>"", "description"=>"", "image_url"=>"", "director_id"=>"825"}, "commit"=>"Create Movie"}

    # Strong Parameters require whitelisting prior to mass assignment

    params.require(:movie).permit(:title, :year, :duration, :description, :image_url, :director_id)
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to movies_url
    else
      render 'new'
    end

    # @movie = Movie.new
    # @movie.title = params[:movie][:title]
    # @movie.year = params[:movie][:year]
    # @movie.duration = params[:movie][:duration]
    # @movie.description = params[:movie][:description]
    # @movie.image_url = params[:movie][:image_url]
    # @movie.director_id = params[:movie][:director_id]

    # if @movie.save
    #   redirect_to movies_url
    # else
    #   render 'new'
    # end
  end

  def edit
  end

  def update
    @movie.title = params[:movie][:title]
    @movie.year = params[:movie][:year]
    @movie.duration = params[:movie][:duration]
    @movie.description = params[:movie][:description]
    @movie.image_url = params[:movie][:image_url]
    @movie.director_id = params[:movie][:director_id]

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
