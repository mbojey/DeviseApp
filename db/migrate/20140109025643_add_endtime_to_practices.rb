class AddEndtimeToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :endtime, :datetime
  end
end
