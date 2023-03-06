require 'rails_helper'


RSpec.describe "Api::Authors", type: :request do
  let!(:authors) { create_list(:author, 3) }

  shared_examples 'returns valid author resource JSON' do
    it 'returns valid author resource JSON' do
      expect(response.status).to eq(200)

      expect(json['data'][0]).to have_type('author')
      expect(json['data'][0]).to have_attribute(:first_name)
      expect(json['data'][0]).to have_attribute(:last_name)
      expect(json['data'][0]).to have_attribute(:email)
      expect(json['data'][0]).to have_attribute(:phone_number)
    end
  end

  ##INDEX all users
  describe "GET /api/v1/authors" do
    context 'without options' do
      before { get '/api/v1/authors' }

      it_behaves_like 'returns valid author resource JSON'

      it 'returns all authors' do
        expect(json['data'][0]).to have_type('author')
        expect(json['data'].size).to eq(authors.count)
        ##sprawdzić czy zwraca array
      end
    end
  end

  ###GET exact user
  describe "GET /api/v1/authors/[:id]" do
    context 'without options' do
      before { get "/api/v1/authors/#{authors.first.id}" }


      it 'returns exact author' do
        expect(json['data']).to have_type('author')
        expect(json.size).to eq(1)
        expect(response.status).to eq(200)
      end
    end
  end

  ##CREATE user
  describe "CREATE /api/v1/authors" do
    context 'with valid credentials' do

      let(:author_params) {{author:
        {
          first_name: authors.first.first_name,
          last_name: authors.first.last_name,
          email: authors.first.email,
          phone_number: authors.first.phone_number
        }}}

      before { post "/api/v1/authors", params: author_params}

      it 'creates author' do

        expect(json.size).to eq(7)
        expect(response.status).to eq(200)
        expect(json["first_name"]).to match(authors.first.first_name)
        expect(json["last_name"]).to match(authors.first.last_name)
        expect(json["email"]).to match(authors.first.email)
        expect(json["phone_number"]).to match(authors.first.phone_number)
      end
    end
    context 'with invalid credentials' do

      let(:author_params) {{author:
                              {
                                first_name: authors.first.first_name,
                                last_name: authors.first.last_name,
                                email: authors.first.email
                              }}}

      before { post "/api/v1/authors", params: author_params}

      it 'creates author' do
        expect(json.size).to eq(1)
        expect(response.status).to eq(200)
      end
    end
    end

  ##sprawdzić przed i po
  ###UPDATE user
  describe "UPDATE /api/v1/authors" do
    context 'with valid credentials' do

      let(:author_params) {{author: { first_name: "Heniek"}}}


      it 'updates author' do
        get "/api/v1/authors/#{authors.first.id}"
        expect(response.status).to eq(200)
        expect(json["data"]["attributes"]["first_name"]).to match(authors.first.first_name)

        put "/api/v1/authors/#{authors.first.id}", params: author_params
        expect(response.status).to eq(200)
        expect(json["data"]["attributes"]["first_name"]).to match("Heniek")
      end
    end
  end


  ###DELETE user
  describe "DELETE /api/v1/authors" do
    context 'with valid credentials' do


      it 'destroys author' do
        get "/api/v1/authors/#{authors.first.id}"
        expect(response.status).to eq(200)
        expect(json["data"]["attributes"]["first_name"]).to match(authors.first.first_name)

        delete "/api/v1/authors/#{authors.first.id}"
        expect(response.status).to eq(200)
        expect(json["data"]["attributes"]["first_name"]).to match(authors.first.first_name)
      end
    end
  end
end
