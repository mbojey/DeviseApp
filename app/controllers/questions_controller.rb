class QuestionsController < ApplicationController
	

  def correct
    @user = current_user
    if @user.assistant || @user.instructor
      @question = Question.find_by(id: params[:id])
      @question.update_attribute(:grade, "Correct")
      @questions = Question.where(:topic_id => @question.topic_id, :lab => @question.lab)
    else
      @questions = nil
    end
  end

  def view
    @user = current_user
    @question = Question.find_by(id: params[:id])
  end

  def mark
    @user = current_user
    @question = Question.find_by(id: params[:id])
  end

  def flagview
    @user = current_user
    @question = Question.find_by(id: params[:id])
  end

  def incorrect
    @user = current_user
    if @user.assistant || @user.instructor
      @question = Question.find_by(id: params[:id])
      @question.update_attribute(:grade, "Incorrect")
      @questions = Question.where(:topic_id => @question.topic_id, :lab => @question.lab)
    else
      @questions = nil
    end
  end

  def changes
    @user = current_user
    @question = Question.find_by(id: params[:id])
  end

  def comment
    @user = current_user
    if @user.assistant || @user.instructor
      @question = Question.find_by(id_params)
      @question.update_attributes(grade_params)
      @questions = Question.where(:topic_id => @question.topic_id, :lab => @question.lab)
    else
      @questions = nil
    end
  end

  def your_questions
    @user = current_user
    @questions = Question.where(user_id: current_user.user_id)
  end

  def flag_questions
    @user = current_user
    if @user.instructor
      @questions = Question.where(submitted: true)
    else
      @questions = nil
    end
  end

  def flag
    @user = current_user
    if @user.instructor
      @question = Question.find_by(id: params[:id])
      @question.update_attribute(:exam, true)
    end
    redirect_to "/flag_questions"
  end

   def unflag
    @user = current_user
    if @user.instructor
      @question = Question.find_by(id: params[:id])
      @question.update_attribute(:exam, false)
    end
    redirect_to "/flag_questions"
  end

  def submit
    @user = current_user
    @question = Question.find_by(id: params[:id])
    @question.update_attribute(:submitted, true)
    @question.update_attribute(:grade, "Review Pending")
    @question.update_attribute(:date_submitted, (DateTime.now.to_time - 8.hours).to_datetime)
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
    @topic = Topic.all
    @answer = ['a', 'b', 'c', 'd', 'e']
  end

  def update
    @user = current_user
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    @answer = answer_params.to_s
      if @answer[12, @answer.length - 14] == "a"
        @question.answer = 1
      elsif @answer[12, @answer.length - 14] == "b"
        @question.answer = 2
      elsif @answer[12, @answer.length - 14] == "c"
        @question.answer = 3
      elsif @answer[12, @answer.length - 14] == "d"
        @question.answer = 4
      elsif @answer[12, @answer.length - 14] == "e"
        @question.answer = 5
      end
    @question.save
    redirect_to "/your_questions"
  end

  def new
    @user = current_user
    @userID = current_user.user_id
    @question = Question.new
    @topic = Topic.all
    @answer = ['a', 'b', 'c', 'd', 'e']
  end

  def create
    @user = current_user
	  if user_signed_in?
	    @question = Question.new(question_params)
	    @question.user_id = current_user.user_id
      @question.lab = current_user.lab
      @answer = answer_params.to_s
      if @answer[12, @answer.length - 14] == "a"
        @question.answer = 1
      elsif @answer[12, @answer.length - 14] == "b"
        @question.answer = 2
	    elsif @answer[12, @answer.length - 14] == "c"
        @question.answer = 3
      elsif @answer[12, @answer.length - 14] == "d"
        @question.answer = 4
      elsif @answer[12, @answer.length - 14] == "e"
        @question.answer = 5
      end
      @question.submitted = !(params[:submitted].to_s.include? "Create")
      if @question.save
        if @question.submitted
          @question.grade = "Review Pending"
          @question.date_submitted = (DateTime.now.to_time - 8.hours).to_datetime
          @question.save
	        flash[:success] = "Question submitted!"
        else
          flash[:success] = "Question created!"
        end
	      redirect_to "/your_questions"
	    else
	      flash[:error] = "Please fill in all required fields."
        redirect_to "/questions/new"
	    end
	  end
  end

   private
    
    def question_params
      params.require(:question).permit(:qtext, :a1text, :a2text, :a3text, :a4text, :a5text, :topic_id, :submitted)
    end

    def answer_params
      params.require(:question).permit(:answer)
    end

    def id_params
      params.require(:question).permit(:question_id)
    end

    def grade_params
      params.require(:question).permit(:grade)
    end
end