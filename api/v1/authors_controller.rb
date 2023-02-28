module Api
  module V1
    class AuthorsController < Api::V1::ApplicationController
    before_action :set_author, only: %i[ show edit update destroy ]

    # GET /authors or /authors.json
    def index
      @authors = Author.all
    end

    # GET /authors/1 or /authors/1.json
    def show
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
      @author = Author.new(author_params)

      respond_to do |format|
        if @author.save
          format.json { render :show, status: :created, location: @author }
        else
          format.json { render json: @author.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /authors/1 or /authors/1.json
    def update
      respond_to do |format|
        if @author.update(author_params)
          format.json { render :show, status: :ok, location: @author }
        else
          format.json { render json: @author.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /authors/1 or /authors/1.json
    def destroy
      @author.destroy

      respond_to do |format|
        format.json { head :no_content }
      end
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
