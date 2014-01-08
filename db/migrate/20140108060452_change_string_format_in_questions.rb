class ChangeStringFormatInQuestions < ActiveRecord::Migration

  def self.up
   change_column :questions, :qtext, :text
   change_column :questions, :a1text, :text
   change_column :questions, :a2text, :text
   change_column :questions, :a3text, :text
   change_column :questions, :a4text, :text
   change_column :questions, :a5text, :text
   change_column :questions, :grade, :text
  end

  def self.down
   change_column :questions, :qtext, :string
   change_column :questions, :a1text, :string
   change_column :questions, :a2text, :string
   change_column :questions, :a3text, :string
   change_column :questions, :a4text, :string
   change_column :questions, :a5text, :string
   change_column :questions, :grade, :string
  end
end
