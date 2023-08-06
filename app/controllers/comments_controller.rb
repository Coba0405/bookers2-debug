class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    redirect_to request.referer
  end

private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end