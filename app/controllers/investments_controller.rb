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
    @alloc_one = investment_params[:allocation_inv_one].to_f / 100
    @alloc_two = investment_params[:allocation_inv_two].to_f / 100
    @alloc_three = investment_params[:allocation_inv_three].to_f / 100
    
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
    
    allocation_arr = [@alloc_one, @alloc_two, @alloc_three]
    
    # Find average expense ratio
    sum = 0
    expense_ratios_arr.each_with_index do |ratio, alloc|
      sum += (ratio.to_f * allocation_arr[alloc])
    end
    
    @user.investments.create(
      investment_one: @investment_one.ticker,
      investment_two: @investment_two.ticker,
      investment_three: @investment_three.ticker,
      average_exp_ratio: sum.to_f,
      allocation_inv_one: @alloc_one,
      allocation_inv_two: @alloc_two,
      allocation_inv_three: @alloc_three
    )
    Projection.first_contribution(@user)
    redirect_to user_path(@user)
  end
  
  private
  
  def investment_params
    params.require(:investment).permit(:investment_one, :investment_two, :investment_three, :allocation_inv_one, :allocation_inv_two, :allocation_inv_three)
  end
end