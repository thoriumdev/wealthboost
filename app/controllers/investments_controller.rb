class InvestmentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @investment = Investment.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @investment_one = investment_params[:investment_one].upcase
    @investment_two = investment_params[:investment_two].upcase
    @investment_three = investment_params[:investment_three].upcase
    
    @investment_one = Market.where("ticker = '#{@investment_one}'")[0]
    @investment_two = Market.where("ticker = '#{@investment_two}'")[0]
    @investment_three = Market.where("ticker = '#{@investment_three}'")[0]
    
    # If one of the users expense ratios is missing
    # use expense ratio of a security with the same
    # asset class and the highest total assets
    investments_arr = [@investment_one, @investment_two, @investment_three]
    expense_ratios_arr = []
    
    investments_arr.each do |inv|
      if (inv.expense_ratio.to_f == 0)
        sec = Market.where("asset_class = '#{inv.asset_class}'").order(total_assets: :desc).limit(1)[0]
        expense_ratios_arr << sec.expense_ratio.to_f
      else
        expense_ratios_arr << inv.expense_ratio.to_f
      end
    end
    
    # Find average expense ratio
    sum = 0
    expense_ratios_arr.each do |ratio|
      sum += ratio.to_f
    end
    @user.investments.create(
      investment_one: @investment_one,
      investment_two: @investment_two,
      investment_three: @investment_three,
      average_exp_ratio: (sum/3).to_f
    )
    Projection.wealth_lost_to_date(@user)
  end
  
  private
  
  def investment_params
    params.require(:investment).permit(:investment_one, :investment_two, :investment_three)
  end
end