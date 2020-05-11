class BooksController < ApplicationController
	def new
	 @book = Book.new
    end
    def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to book_path(@book.id)

    end
    def index
	    @books = Book.all
	    @book = Book.new

    end
    def show
     @book = Book.find(params[:id])
     
    end
    def edit
    end
    def update
    @book = User.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
    end
    def destroy
    end
end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end