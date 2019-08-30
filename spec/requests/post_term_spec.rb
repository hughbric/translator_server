require 'rails_helper'

describe 'Post a term route', :type => :request do
  describe 'Saved term' do
    before do
      post '/terms', params: { :term => 'banana' }
    end

    it 'returns status success' do
      expect(JSON.parse(response.body)['status']).to eq('SUCCESS')
    end

    it 'returns status success' do
      expect(JSON.parse(response.body)['message']).to eq('Saved term')
    end

    it 'returns the term' do
      expect(JSON.parse(response.body)['data']['term']).to eq('banana')
    end

    it 'returns the terms\'s pig-latin' do
      expect(JSON.parse(response.body)['data']['pig_latin']).to eq('ananabay')
    end

    it 'returns status success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Term not saved' do
    before do
      post '/terms', params: { :term => nil }
    end

    it 'returns status success' do
      expect(JSON.parse(response.body)['status']).to eq('ERROR')
    end

    it 'returns status success' do
      expect(JSON.parse(response.body)['message']).to eq('Term not saved')
    end
  end
end