class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
    # @coworkers = @actor.coworkers
  end
end
