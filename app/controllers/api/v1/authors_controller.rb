module Api
  module V1
    class AuthorsController < Api::V1::ApplicationController
    before_action :set_author, only: %i[ show edit update destroy ]

    # GET /authors or /authors.json
    def index
      authors = Author.all
      render json: {status: "SUCCESS", message: "Loaded authors", data: authors }, status: :ok
    end

    # GET /authors/1 or /authors/1.json
    def show
      authors = Author.find(params[:id])
      render json: {status: "SUCCESS", message: "Loaded author", data: authors }, status: :ok
    end

    # GET /authors/new
    def new
      @author = Author.new
    end

    # GET /authors/1/edit
    def edit
    end

    # POST /authors or /authors.json
    def create
      author = Author.new(author_params)
        if author.save
          render json: { status: "SUCCESS", message: "Author saved", data: author }
        else
          render json: { status: "ERROR", message: "Author not saved", data: author.errors }
        end
      end


    # PATCH/PUT /authors/1 or /authors/1.json
    def update
      author = Author.find(params[:id])
      if author.update(author_params)
        render json: { status: "SUCCESS", message: "Author saved", data: author }
      else
        render json: { status: "ERROR", message: "Author not saved", data: author.errors }
      end
    end

    # DELETE /authors/1 or /authors/1.json
    def destroy
      author = Author.find(params[:id])
      author.destroy
      render json: { status: "SUCCESS", message: "Deleted author", data: author }
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:first_name, :last_name, :email, :phone_number)

      end
    end
  end
end
