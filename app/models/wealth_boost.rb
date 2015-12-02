class WealthBoost < ActiveRecord::Base
  belongs_to :user
  
  def self.assumed_projected_return(user)
    # Investment Weights
    weight_one = user.investments.last.allocation_inv_one.to_f
    weight_two = user.investments.last.allocation_inv_two.to_f
    weight_three = user.investments.last.allocation_inv_three.to_f
    
    # Holding Period
    holding_period = user.investments_length
  end
end