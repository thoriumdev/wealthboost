class SecuritiesController < ApplicationController
  def index
    @results = Market.first_two_recommendations(params[:q])
    @last_result = Market.last_recommendation(params[:q])
  end
end