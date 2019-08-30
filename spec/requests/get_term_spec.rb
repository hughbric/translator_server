require 'rails_helper'

describe "Get a term route", :type => :request do
  before(:each) do
    @term = FactoryBot.create(:random_term)
  end

  before { get "/terms/#{@term.id}" }

  it 'returns a single term' do
    expect(JSON.parse(response.body).size).to eq(3)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end