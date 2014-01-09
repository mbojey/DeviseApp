class AddStarttimeToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :starttime, :datetime
  end
end
