class Practice < ActiveRecord::Base

	belongs_to :user
	has_one :topic
	has_one :question

	after_create :do_setID
  
  	private
    	def do_setID
     		newID = self.id
      		self.update_attributes(:practice_id => newID)
		end
end