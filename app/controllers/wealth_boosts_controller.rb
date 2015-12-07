class WealthBoostsController < ApplicationController
  def index
    
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

    assum_proj_return = WealthBoost.assumed_projected_return(@user)
    current_exp_ratio = @user.investments.last.average_exp_ratio.to_f
    current_net_return = assum_proj_return - (current_exp_ratio/100)
    
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
    
    low_fee_exp_ratio_sum = 0
    recommendations_hash.each do |key, value|
      low_fee_exp_ratio_sum += value[0].expense_ratio.to_f
    end
    
    low_fee_exp_ratio = low_fee_exp_ratio_sum / 3
    
    # @user.wealth_boosts.create(
    #   year: 2015,
    #   current_port: @user.current_investments_amount,
    #   low_fee_port: @user.current_investments_amount,
    #   proj_period: 65 - @user.age,
    #   final_year_proj: 2015 + (65 - @user.age),
    #   wealth_boost: 0
    # )
  end
end