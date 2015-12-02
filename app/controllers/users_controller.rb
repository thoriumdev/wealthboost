class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projection_retirement = @user.projections
    @fees_sum_retirement = 0
    @projection_retirement.each do |projection|
      @fees_sum_retirement += projection.fees_paid
    end
    
    @projection_now = @user.projections.where("age < ?", @user.age)
    @fees_sum_now = 0
    @projection_now.each do |projection|
      @fees_sum_now += projection.fees_paid
    end
    # # Generate Recommendations
    # recommendations = []
    # investments_arr.each do |inv|
    #   recommendations << Security.generate_recommendations(inv)
    #   recommendations << Security.generate_last_recommendation(inv)
    # end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_account_path(@user)
    else
      render "new"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :income, :email, :password, :password_confirmation, :retired, :current_investments, :current_investments_amount, :investments_length, :current_custodian, :portfolio => []
    )
  end
end