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

  def show
    term = Term.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded term', data:term},status: :ok
  end

  def destroy
    term = Term.find(params[:id])
    term.destroy
    render json: {status: 'SUCCESS', message:'Deleted term', data:term},status: :ok
  end

  def update
    term = Term.find(params[:id])
    term.pig_latin = term.translate_term(term.term)
    if term.update_attributes(term_params)
      render json: {status: 'SUCCESS', message:'Updated term', data:term},status: :ok
    else
      render json: {status: 'ERROR', message:'Term not updated', data:term.errors},status: :unprocessable_entity
    end
  end

  private

  def term_params
    params.permit(:term, :pig_latin)
  end
end