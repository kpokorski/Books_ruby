module Api
  module V1
    class AuthorsController < Api::V1::ApplicationController
    before_action :set_author, only: %i[ show edit update destroy ]

    # GET /authors or /authors.json
    def index
      authors = Author.all
      json_string = AuthorSerializer.new(authors)
      render json: {status: :ok, message: "Loaded authors", data: json_string }
    end

    # GET /authors/1 or /authors/1.json
    def show
      render json: {status: :ok, message: "Author", data: @json_string }
    end

    # POST /authors or /authors.json
    def create
      author = Author.new(author_params)
        if author.save
          render json: { status: :ok, message: "Author saved", data: author }
        else
          render json: { status: "ERROR", message: "Author not saved", data: author.errors }
        end
      end


    # PATCH/PUT /authors/1 or /authors/1.json
    def update
      if @author.update(author_params)
        render json: { status: :ok, message: "Author updated", data: @json_string }
      else
        render json: { status: "ERROR", message: "Author not updated", data: @author.errors }
      end
    end

    # DELETE /authors/1 or /authors/1.json
    def destroy
      @author.destroy
      render json: { status: :ok, message: "Deleted author", data: @json_string }
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
        @json_string = AuthorSerializer.new(@author)
      end

      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:first_name, :last_name, :email, :phone_number)

      end
    end
  end
end
