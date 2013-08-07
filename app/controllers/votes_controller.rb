class VotesController < ApplicationController
  before_action :find_vote, :only => [:show, :edit, :update, :destroy]
  before_action :user_owns_vote, :only => [:edit, :update, :destroy]

  def find_vote
    @vote = Vote.find_by_id(params[:id])
  end

  def user_owns_vote
    if @vote.user != current_user
      redirect_to votes_url, :notice => "Not authorized for that."
    end
  end

  def index
    @votes = Vote.all
  end

  def show
  end

  def new
    @vote = Vote.new
    if current_user.blank?
      redirect_to votes_url, :notice => "Please sign in to vote."
      return
    end
  end

  def create
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.movie_id = params[:movie_id]

    if @vote.save
      redirect_to movies_url, :notice => "Voted successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
      redirect_to votes_url
    else
      render 'new'
    end
  end

  def destroy
    @vote.destroy
    redirect_to votes_url, :notice => "Vote destroyed."
  end
end














