class AddTotalScoreToSecurity < ActiveRecord::Migration
  def change
    add_column :securities, :total_score, :integer
  end
end
