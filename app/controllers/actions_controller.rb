class ActionsController < ApplicationController
  def create
    @action = Action.new(action_params)
    
    if @action.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@action.participation) }
        format.html { redirect_to @action.round }
      end
    else
      # TODO
    end
  end
  
  def destroy
    @action = Action.find(params[:id])
    
    if @action.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@action.participation) }
        format.html { redirect_to @action.round }
      end
    else
      # TODO
    end
  end
  
  def action_params
    params.require(:participation_action).permit(:activity_cost).merge(params.permit(:participation_id, :type))
  end
end
