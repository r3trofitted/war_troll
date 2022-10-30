class ResolutionsController < ApplicationController
  before_action :load_resolution
  
  def success
    if @resolution.success!
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@resolution.participation) }
        format.html { redirect_to @resolution.round }
      end
    else
      # TODO
    end
  end
  
  def failure
    if @resolution.failure!
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@resolution.participation) }
        format.html { redirect_to @resolution.round }
      end
    else
      # TODO
    end
  end
  
  def destroy
    if @resolution.undo!
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@resolution.participation) }
        format.html { redirect_to @resolution.round }
      end
    else
      # TODO
    end
  end
  
  private
  
  def load_resolution
    @resolution = Resolution.new(action: Action.find(params[:action_id]))
  end
end
