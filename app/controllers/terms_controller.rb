class TermsController < ApplicationController
end
class TermsController < ApplicationController
  def index
    terms = Term.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Loaded terms', data:terms},status: :ok
  end
end