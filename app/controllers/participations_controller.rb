class ParticipationsController < ApplicationController
  before_action :load_round
  
  def new
    @participation = @round.participations.build(combatant: Combatant.new)
  end
  
  def create
    @participation = @round.participations.build(participation_params)
    if @participation.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @round }
      end
    else
      render "new"
    end
  end
  
  private
  
  def load_round
    @round = Round.find params[:round_id]
  end
  
  def participation_params
    params.require(:participation).permit(:base_activity, combatant_attributes: [:name, :base_hit_points])
  end
end
