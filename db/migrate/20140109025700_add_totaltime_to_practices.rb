class AddTotaltimeToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :totaltime, :integer
  end
end
