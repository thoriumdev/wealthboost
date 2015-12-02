class Projection < ActiveRecord::Base
  belongs_to :user
  
  def self.first_contribution(user)
    # FV = P[(1+r)N - (1+g)N]/(r-g)
    fv_denominator = (((1 + user.return_today.to_f / 100) ** user.investments_length) - ((1 + user.salary_growth.to_f / 100) ** user.investments_length)) / (user.return_today.to_f / 100 - user.salary_growth.to_f / 100)
    
    fv = user.current_investments_amount
    first_contribution = fv/fv_denominator
    
    Projection.make_projection_now(user, first_contribution)
  end
  
  def self.make_projection_now(user, contribution)
    starting_age = user.age - user.investments_length + 1
    starting_value = 0
    age_counter = 0
    contribution = contribution
    counter = user.investments_length
    until counter <= 0
      age = starting_age + age_counter
      
      if counter == 1
        ending_value = starting_value + contribution
      else
        ending_value = (starting_value + contribution) * (1 + user.return_today.to_f / 100)
      end
      
      avrg_expense_ratio = (user.investments[0].average_exp_ratio.to_f) / 100
      fees_paid = ending_value * avrg_expense_ratio
      
      user.projections.create(age: age, contribution: contribution, starting_value: starting_value, ending_value: ending_value, fees_paid: fees_paid)
      counter -= 1
      age_counter += 1
      starting_value = ending_value
      contribution = contribution * (1 + (user.salary_growth.to_f / 100))
    end
    Projection.make_projection_retirement(user)
  end
  
  def self.make_projection_retirement(user)
    starting_age = user.age + 1
    contribution = user.income * 0.06
    starting_value = user.projections.last.ending_value + contribution
    counter = 65 - user.age
    age_counter = 0
    
    until counter <= 0
      age = starting_age + age_counter
      
      if counter == 1
        ending_value = starting_value * (1 + user.return_retirement.to_f / 100)
      else
        ending_value = starting_value * (1 + user.return_retirement.to_f / 100)
      end
      
      avrg_expense_ratio = (user.investments[0].average_exp_ratio.to_f) / 100
      fees_paid = ending_value * avrg_expense_ratio
      
      user.projections.create(age: age, contribution: contribution, starting_value: starting_value, ending_value: ending_value, fees_paid: fees_paid)
      
      counter -= 1
      age_counter += 1
      contribution = contribution * (1 + (user.salary_growth.to_f / 100))
      starting_value = ending_value + contribution
    end
  end
end