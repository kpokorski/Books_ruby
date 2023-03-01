module Api
  module V1
    class BooksController < Api::V1::ApplicationController

    before_action :set_book, only: %i[ show edit update destroy ]

    # GET /books or /books.json
    def index
      books = Book.all
      render json: {status: "SUCCESS", message: "Loaded books", data: books }, status: :ok
    end

    # GET /books/1 or /books/1.json
    def show
      books = Book.find(params[:id])
      render json: {status: "SUCCESS", message: "Loaded book", data: books }, status: :ok
    end

    # GET /books/new
    def new
      @book = Book.new
    end

    # GET /books/1/edit
    def edit
    end

    # POST /books or /books.json
    def create
      book = Book.new(author_params)
      if book.save
        render json: { status: "SUCCESS", message: "Book saved", data: book }
      else
        render json: { status: "ERROR", message: "Book not saved", data: book.errors }
      end
    end

    # PATCH/PUT /books/1 or /books/1.json
    def update
      book = Book.find(params[:id])
        if book.update(book_params)
          render json: { status: "SUCCESS", message: "Book saved", data: book }
        else
          render json: { status: "ERROR", message: "Book not saved", data: book.errors }
        end
      end

    # DELETE /books/1 or /books/1.json
    def destroy
      book = Book.find(params[:id])
      book.destroy
      render json: { status: "SUCCESS", message: "Deleted author", data: book }
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:tittle, :year,:ISBN_number,:publishing_house,:author_id,:description,:cover)
      end
  end
  end
end
