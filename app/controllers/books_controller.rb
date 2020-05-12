class BooksController < ApplicationController
	def new
	 @book = Book.new
    end
    def create
     @book = Book.new(book_params)
     @books = Book.all
     @book.user_id = current_user.id
     if @book.save
     flash[:notice] = 'successfully　投稿しました'
     redirect_to book_path(@book.id)
     else
     render :index
     end

    end
    def index
	    @books = Book.all
	    @booknew = Book.new
        @user = User.find(current_user.id)

    end
    def show
     @book = Book.find(params[:id])
     @new = Book.new
     @user = User.find(current_user.id)

    end
    def edit
    @book = Book.find(params[:id])
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
     book = Book.find(params[:id])
     if book.user_id == current_user.id
     book.destroy
     redirect_to book_path(@book.id)
  end
end
end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end