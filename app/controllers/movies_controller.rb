class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    if params[:actor].present?
      @movie.add_actor(params[:actor])
      @actors = @movie.actors.order_by_age
    else
      @actors = @movie.actors.order_by_age
    end
    @average_age = @movie.actors.average_age
  end
end
