class WealthBoost < ActiveRecord::Base
  belongs_to :user
  
  def self.assumed_projected_return(user)
    # Holding Period
    holding_period = user.investments_length
    
    # Find Users investments
    inv = user.investments.last
    
    inv_one = Market.where("ticker = '#{inv.investment_one}'")[0]
    inv_two = Market.where("ticker = '#{inv.investment_two}'")[0]
    inv_three = Market.where("ticker = '#{inv.investment_three}'")[0]
    
    # Find annual returns based on holding Period
    inv_one_return = 0
    inv_two_return = 0
    inv_three_return = 0
    
    if (1..5).member?(holding_period)
      inv_one_return = inv_one.five.to_f
      inv_two_return = inv_two.five.to_f
      inv_three_return = inv_three.five.to_f
    elsif (5..10).member?(holding_period)
      inv_one_return = inv_one.ten.to_f
      inv_two_return = inv_two.ten.to_f
      inv_three_return = inv_three.ten.to_f
    elsif (10..15).member?(holding_period)
      inv_one_return = inv_one.fifteen.to_f
      inv_two_return = inv_two.fifteen.to_f
      inv_three_return = inv_three.fifteen.to_f
    elsif (15..20).member?(holding_period)
      inv_one_return = inv_one.twenty.to_f
      inv_two_return = inv_two.twenty.to_f
      inv_three_return = inv_three.twenty.to_f
    else
      inv_one_return = inv_one.retirement.to_f
      inv_two_return = inv_two.retirement.to_f
      inv_three_return = inv_three.retirement.to_f
    end
    
    # Calculate Average Annual Return
    aar = (inv_one_return + inv_two_return + inv_three_return) / 3
    return aar
  end
end