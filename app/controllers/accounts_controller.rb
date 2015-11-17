class AccountsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    binding.pry
  end
end