class MoviesController < ApplicationController

  def index
    @movies = Movie.order(year: :desc)
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.new(name: params[:movie][:name], synopsis: params[:movie][:name], year: params[:movie][:year])
    if @movies.save
      redirect_to "/"
    else
      render :new
    end
  end

end

