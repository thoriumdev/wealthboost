class MarketsController < ApplicationController
  def index
  end
  
  def import
    Market.import(params[:file])
    redirect_to import_path
  end
  
  def input_ticker
    Market.look_up_asset_class(params[:q])
  end
end