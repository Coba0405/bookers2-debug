class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @comments = @book.comments #投稿詳細に関連付けてあるコメントを全取得
    @comment = Comment.new #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = current_user.book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :book_content)
  end
end
