require 'rails_helper'

describe "Get all terms route", :type => :request do
  let!(:data) { FactoryBot.create_list(:random_term, 20) }
  before { get '/' }

  it 'returns all terms' do
    expect(JSON.parse(response.body)['data'].size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end