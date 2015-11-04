class MarketsController < ApplicationController
  def index
  end
  
  def import
    Market.import(params[:file])
    redirect_to import_path
  end
end