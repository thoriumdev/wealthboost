class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projections = @user.projections
    @fees_sum = 0
    @projections.each do |projection|
      @fees_sum += projection.fees_paid
    end
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
    params.require(:user).permit(:first_name, :last_name, :age, :income, :email, :password, :password_confirmation, :retired, :current_investments, :current_investments_amount, :investments_length, :current_custodian)
  end
end