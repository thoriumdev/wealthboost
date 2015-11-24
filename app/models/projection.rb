class Projection < ActiveRecord::Base
  belongs_to :user
  
  def self.wealth_lost_to_date(user)
    # FV = P[(1+r)N - (1+g)N]/(r-g)
    fv_denominator = (((1 + user.return_today.to_f / 100) ** user.investments_length) - ((1 + user.salary_growth.to_f / 100) ** user.investments_length)) / (user.return_today.to_f / 100 - user.salary_growth.to_f / 100)
    
    fv = user.current_investments_amount
    
    first_contribution = fv/fv_denominator
    starting_age = user.age - user.investments_length + 1
    starting_value = 0
    ending_value = (starting_value + first_contribution) * (1 + user.return_today.to_f / 100)
    avrg_expense_ratio = user.investments
    binding.pry
  end
end