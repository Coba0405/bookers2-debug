class FavoritesController < ApplicationController
  
  def create
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    @book_favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @book_favorite.destroy
      redirect_to request.referer
  end
end
