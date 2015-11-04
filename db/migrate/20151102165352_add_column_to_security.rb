class AddColumnToSecurity < ActiveRecord::Migration
  def change
    add_column :securities, :compared_to_security, :string
  end
end
