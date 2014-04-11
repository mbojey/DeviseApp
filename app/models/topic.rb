class Topic < ActiveRecord::Base

	has_many :questions
	

	validates :name, presence: true

	after_create :do_setID
  
  	private
    	def do_setID
     		newID = self.id
      		self.update_attributes(:topic_id => newID)
		end
end