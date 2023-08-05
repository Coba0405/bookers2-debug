class ControllerFavoritesController < ApplicationController
  
  def create
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    @book_favorite.save
    redirect_to book_path(params[:book_id])
  end
  
  def destroy
    @book_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
      redirect_to post_path(params[:post_id]) 
  end
end
