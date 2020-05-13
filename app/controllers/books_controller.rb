class BooksController < ApplicationController
    before_action :authenticate_user!

	def new
    end
    def create
     #@book = Book.new
     @new = Book.new(book_params)
     @books = Book.all
     @new.user_id = current_user.id
     if @new.save
         flash[:notice] = 'successfully　投稿しました'
         redirect_to book_path(@new.id)
     else
        @user = current_user
        @books = Book.all
        render :index
     end

    end
    def index
	    @books = Book.all
        @user = current_user
        @new = Book.new

    end
    def show
     @book = Book.find(params[:id])
     @new = Book.new
     @user = @book.user
     
    end

    def ensure_correct_user
        if @current_user.id !=  params[:id].to_i
         redirect_to("/posts/index")
        end
    end

    def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
    redirect_to books_path
  end
    end

    def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = 'successfully　投稿を編集しました'
    redirect_to book_path(@book.id)
    else
    render :edit
    end
    end

    def destroy
     @book = Book.find(params[:id])
     #if  @book.user_id == current_user.id
         @book.destroy
         redirect_to books_path(@book.id)
     #end
    end
end

private
    def book_params
        params.require(:book).permit(:title, :body ,:user_id)
    end