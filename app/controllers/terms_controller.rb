class TermsController < ApplicationController
end
class TermsController < ApplicationController
  def index
    terms = Term.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Loaded terms', data:terms},status: :ok
  end

  def create
    term = Term.new(term_params)
    term.pig_latin = term.translate_term(term.term)

    if term.save
      render json: {status: 'SUCCESS', message:'Saved term', data:term},status: :ok
    else
      render json: {status: 'ERROR', message:'Term not saved', data:term.errors},status: :unprocessable_entity
    end
  end

  private

  def term_params
    params.permit(:term, :pig_latin)
  end
end