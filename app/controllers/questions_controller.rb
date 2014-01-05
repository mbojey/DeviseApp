class QuestionsController < ApplicationController
	

  def correct
    @user = current_user
    @question = Question.find_by(id: params[:id])
    @question.update_attribute(:grade, "Correct")
    @questions = Question.where(:topic_id => @question.topic_id, :lab => @question.lab)
  end

  def incorrect
    @user = current_user
    @question = Question.find_by(id: params[:id])
    @question.update_attribute(:grade, "Incorrect")
    @questions = Question.where(:topic_id => @question.topic_id, :lab => @question.lab)
  end

  def changes
    @user = current_user
    @question = Question.find_by(id: params[:id])
  end

  def comment
    @user = current_user
    @question = Question.find_by(id_params)
    @question.update_attributes(grade_params)
    @questions = Question.where(:topic_id => @question.topic_id, :lab => @question.lab)
  end

  def your_questions
    @user = current_user
    @questions = Question.where(user_id: current_user.user_id)
  end

  def submit
    @user = current_user
    @question = Question.find_by(id: params[:id])
    @question.update_attribute(:submitted, true)
    @question.update_attribute(:grade, "Review Pending")
    redirect_to "/your_questions"
  end

  def hide
    @user = current_user
    @question = Question.find_by(id: params[:id])
    @question.update_attribute(:visible, false)
    redirect_to "/your_questions"
  end

  def edit
    @user = current_user
    @question = Question.find(params[:id])
  end

  def update
    @user = current_user
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    @question.save
    redirect_to "/your_questions"
  end

  def new
    @user = current_user
    @userID = current_user.user_id
    @question = Question.new
    @topic = Topic.all
  end

  def create
    @user = current_user
	  if user_signed_in?
	    @question = Question.new(question_params)
	    @question.user_id = current_user.user_id
      @question.lab = current_user.lab
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

    def id_params
      params.require(:question).permit(:question_id)
    end

    def grade_params
      params.require(:question).permit(:grade)
    end
end