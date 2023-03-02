module Api
  module V1
    class BooksController < Api::V1::ApplicationController

    before_action :set_book, only: %i[ show edit update destroy ]

    # GET /books or /books.json
    def index
      books = Book.includes(:author).all
      json_string = BookSerializer.new(books)
      render json: {status: :ok, message: "Loaded books", data: json_string}
    end

    # GET /books/1 or /books/1.json
    def show
      render json: {status: :ok, message: "Books", data: @json_string}
    end

    # POST /books or /books.json
    def create
      book = Book.new(book_params)
      if book.save
        render json: {status: :ok, message: "Loaded books", data: book}
      else
        render json: { status: "ERROR", message: "Book not loaded", data: book.errors }
      end
    end

    # PATCH/PUT /books/1 or /books/1.json
    def update
        if @book.update(book_params)
          render json: {status: :ok, message: "Book updated", data: @json_string}
        else
          render json: { status: "ERROR", message: "Book not updated", data: @book.errors }
        end
      end

    # DELETE /books/1 or /books/1.json
    def destroy
      @book.destroy
      render json: {status: :ok, message: "Destroyed books", data: @json_string}
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
        @json_string = BookSerializer.new(@book)
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:tittle, :year,:ISBN_number,:publishing_house,:author_id,:description,:cover)
      end
  end
  end
end
