class WealthBoostsController < ApplicationController
  def index
    
  end
  
  def create
    @user = User.find(params[:user_id])
    @user.wealth_boosts.create(
      year: 2015,
      current_port: @user.current_investments_amount,
      low_fee_port: @user.current_investments_amount,
      proj_period: 65 - @user.age,
      final_year_proj: 2015 + (65 - @user.age)
    )
    assum_proj_return = WealthBoost.assumed_projected_return(@user)
  end
end