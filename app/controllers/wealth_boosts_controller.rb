class WealthBoostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @wealth_boosts = @user.wealth_boosts
    @wealth_boost = 0
    @wealth_boosts.each do |boost|
      @wealth_boost += boost.wealth_boost.to_f
    end
    @wealth_boost = @wealth_boost.round(2)
  end
  
  def create
    @user = User.find(params[:user_id])
    inv_one = @user.investments.last.investment_one
    inv_two = @user.investments.last.investment_two
    inv_three = @user.investments.last.investment_three
    
    inv_one = Market.where("ticker = '#{inv_one}'")[0]
    inv_two = Market.where("ticker = '#{inv_two}'")[0]
    inv_three = Market.where("ticker = '#{inv_three}'")[0]
    
    inv_arr = [inv_one, inv_two, inv_three]
    
    # Generate Recommendations
    recommendations_hash = {}
    inv_arr.each do |inv|
      recommendations = []
      recommendations << Security.generate_recommendations(inv)
      recommendations << Security.generate_last_recommendation(inv)
      recommendations_hash[inv.ticker] = recommendations[0]
    end
    
    # Get expense ratios for recommendations
    recommendations_hash.each do |key, values|
      values = values.to_a
      values.each_with_index do |item, index|
        if values[index].expense_ratio < values[index - 1].expense_ratio
          values.delete_at(index-1)
        else
          values.delete_at(index)
        end
      end
    end
    
    WealthBoost.make_projections(@user, recommendations_hash)
    
    redirect_to user_wealth_boosts_path(@user)
  end
end