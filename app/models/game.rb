class Game < ActiveRecord::Base

	belongs_to :user
	has_many :practices

	after_create :do_setID
  
  	private
    	def do_setID
     		newID = self.id
      		self.update_attributes(:game_id => newID)
		end
end