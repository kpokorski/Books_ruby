require 'rails_helper'

RSpec.describe "Api::Books", type: :request do

  describe "GET /api/v1/books" do

    it "checks the response status" do
      get api_v1_books_path
      expect(response).to have_http_status(200)
    end


  end
end
