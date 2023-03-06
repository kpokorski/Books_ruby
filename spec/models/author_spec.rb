require 'rails_helper'

RSpec.describe Author, type: :model do
  it "returns the full name of the user" do
    user = build(:author, first_name:'Przemek')

    expect(user.full_name).to eq 'Przemek Pokorski'
  end
end
