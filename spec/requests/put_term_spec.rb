require 'rails_helper'

describe "PUT /terms/:id" do
  before(:each) do
    @term = FactoryBot.create(:random_term)
  end

  it 'updates a term' do
    @new_term = Faker::Creature::Animal.name

    put "/terms/#{@term.id}", params: { term: @new_term }

    expect(response).to have_http_status(:ok)
    expect(Term.find(@term.id).term).to eq(@new_term)
  end

  it 'fails to update a term' do
    @new_term = nil

    put "/terms/#{@term.id}", params: { term: @new_term }

    expect(response).to have_http_status(:unprocessable_entity)
    expect(Term.find(@term.id)).to eq(@term)
  end
end
