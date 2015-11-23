class AccountsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end
  
  def create
    @user = User.find(params[:user_id])
    acc_names = account_params[:account_names]
    acc_names.each do |acc|
      acc.gsub!("<br>", "")
      acc.gsub!("\n", "")
      acc.squeeze!(" ")
      @user.accounts.create(name: acc)
    end
    
    respond_to do |format|
      format.json { render json: @user }
    end
  end
  
  private
  
  def account_params
    params.require(:account).permit(:account_names => [])
  end
end