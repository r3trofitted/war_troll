class RoundsController < ApplicationController
  def show
    @round = Round.find_by combat_id: params[:combat_id], number: params[:number]
  end
end
