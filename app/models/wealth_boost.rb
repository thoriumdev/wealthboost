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
    
    # Find User's investments weights
    investments = user.investments.last
    weight_one = investments.allocation_inv_one.to_f
    weight_two = investments.allocation_inv_two.to_f
    weight_three = investments.allocation_inv_three.to_f
    
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
    
    # Calculate Weighted Average Annual Return
    waar = (weight_one * inv_one_return) + (weight_two * inv_two_return) + (weight_three * inv_three_return)
    return waar
  end
  
  def self.make_projections(user, recommendations_hash)
    assum_proj_return = WealthBoost.assumed_projected_return(user)
    current_exp_ratio = user.investments.last.average_exp_ratio.to_f
    current_net_return = assum_proj_return - (current_exp_ratio/100)
    low_fee_exp_ratio = WealthBoost.get_low_fee_exp_ratio(recommendations_hash, user)
    low_fee_net_return = assum_proj_return - (low_fee_exp_ratio/100)
    current_port = user.current_investments_amount
    low_fee_port = user.current_investments_amount
    wealth_boost = current_port - low_fee_port
    growth_current = current_port * current_net_return
    growth_low_fee = low_fee_port * low_fee_net_return
    fees_current = current_port * current_exp_ratio/100
    fees_low_fee = low_fee_port * low_fee_exp_ratio/100
    year = Time.now.year
    proj_period = 65 - user.age
    final_year_proj = year + proj_period
    counter = proj_period + 1
    
    until counter <= 0
      user.wealth_boosts.create(
        year: year,
        current_port: current_port,
        low_fee_port: low_fee_port,
        wealth_boost: wealth_boost,
        growth_current: growth_current,
        growth_low_fee: growth_low_fee,
        fees_current: fees_current,
        fees_low_fee: fees_low_fee
      )
      
      counter -= 1
      year += 1
      current_port = current_port + growth_current
      low_fee_port = low_fee_port + growth_low_fee
      wealth_boost = low_fee_port - current_port
      growth_current = current_port * current_net_return
      growth_low_fee = low_fee_port * low_fee_net_return
      fees_current = current_port * current_exp_ratio/100
      fees_low_fee = low_fee_port * low_fee_exp_ratio/100
    end
  end
  
  def self.get_low_fee_exp_ratio(recommendations_hash, user)
    investments = user.investments.last
    
    weight_one = investments.allocation_inv_one
    weight_two = investments.allocation_inv_two
    weight_three = investments.allocation_inv_three
    
    weights_arr = [weight_one, weight_two, weight_three]
    
    low_fee_exp_ratio_sum = 0
    recommendations_hash.each do |key, value|
      value.each_with_index do |item, index|
        low_fee_exp_ratio_sum += (item.expense_ratio.to_f * weights_arr[index])
      end
    end
    return low_fee_exp_ratio_sum
  end
end