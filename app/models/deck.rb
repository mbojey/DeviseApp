class Deck < ActiveRecord::Base

		belongs_to :user
    belongs_to :favorite_deck
        has_many  :cards, dependent: :destroy
        has_one  :course 
        has_one  :subject
 	
    validates :deckTitle, :courseNum, :subjectName, presence: true

 	after_create :do_setID


  def self.search(subject, name, number)
    query_obj = Deck.all
    query_obj = query_obj.where('subjectName like ?', "%#{subject}%") unless subject.blank?
    query_obj = query_obj.where('courseName like ?', "%#{name}%") unless name.blank?
    query_obj = query_obj.where('courseNum like ?', "%#{number}%") unless number.blank?

    query_obj
  end

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:deck_id => newID)


    end
end