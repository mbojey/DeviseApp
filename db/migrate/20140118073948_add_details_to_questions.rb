class AddDetailsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :fname, :string
    add_column :questions, :lname, :string
    add_column :questions, :studentnumber, :integer
  end
end
