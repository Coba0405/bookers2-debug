class RelationshipsController < ApplicationController
  def create
  end
  
  def destroy
    redirect_to request.referer
  end
  
end
