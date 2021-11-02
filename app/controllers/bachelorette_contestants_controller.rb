class BacheloretteContestantsController < ApplicationController
  def index
    bachelorette = Bachelorette.find(params[:id])
    @contestants = bachelorette.contestants
  end
end
