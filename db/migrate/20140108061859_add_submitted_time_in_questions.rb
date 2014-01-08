class AddSubmittedTimeInQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :date_submitted, :datetime
  end
end
