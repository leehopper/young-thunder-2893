class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.order_by_age
    @average_age = @movie.actors.average_age
  end
end
