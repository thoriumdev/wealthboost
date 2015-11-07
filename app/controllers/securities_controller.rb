class SecuritiesController < ApplicationController
  def index
    @results = Market.first_two_recommendations(params[:q])
    @last_results = Market.last_recommendation(params[:q])
  end
end