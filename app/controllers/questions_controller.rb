class QuestionsController < ApplicationController
	def show
     

  end

  def your_questions
    @questions = Question.where(user_id: current_user.user_id)
  end
  def new
    @userID = current_user.user_id
    @question = Question.new
    @topic = Topic.all
    @topics = Array.new
    @topic.each do |t|
      @topics << t.name
    end
  end

  def create
	  if user_signed_in?
	    @question = Question.new(question_params)
	    @question.user_id = current_user.user_id
	    if @question.save
	      flash[:success] = "Question created!"
	      redirect_to root_path
	    else
	      flash[:error] = "Please fill in all required fields."
	    end
	  end
  end

   private
    
    def question_params
        params.require(:question).permit(:qtext, :a1text, :a2text, :a3text, :a4text, :a5text, :answer, :topic_id)
    end
end