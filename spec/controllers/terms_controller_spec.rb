require 'rails_helper'

RSpec.describe TermsController, type: :controller do
  describe 'index' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
