require 'rails_helper'

describe 'Delete term route' do
  before(:each) do
    @term = FactoryBot.create(:random_term)
    @term_id = @term.id
  end

  it 'should delete the term' do
    get '/terms'

    expect(response).to have_http_status(200)
    expect(Term.find(@term.id)).to eq(@term)

    delete "/terms/#{@term.id}"

    expect(JSON.parse(response.body)['message']).to eq('Deleted term')
    
    get '/terms'
    expect{ Term.find(@term.id) }.to raise_error
  end
end