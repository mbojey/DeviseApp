class SearchController < ApplicationController

	def find_questions
		@user = current_user
		@result = Result.new
		@topic = Topic.all
		@users = User.all
		@lab = Array.new
		@users.each do |u|
			if !@lab.include?(u.lab)
				@lab.push(u.lab)
			end
		end
	end

	def create
		@user = current_user
		@result = Result.create(result_params)
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end

	def name
		@user = current_user
		@result = Result.new
		@result.name = params[:topic_id]
		@result.lab = params[:lab]
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end

	def number
		@user = current_user
		@result = Result.new
		@result.name = params[:topic_id]
		@result.lab = params[:lab]
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end

	def lab
		@user = current_user
		@result = Result.new
		@result.name = params[:topic_id]
		@result.lab = params[:lab]
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end
	
	def topic
		@user = current_user
		@result = Result.new
		@result.name = params[:topic_id]
		@result.lab = params[:lab]
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end

	def time
		@user = current_user
		@result = Result.new
		@result.name = params[:topic_id]
		@result.lab = params[:lab]
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end

	def grade
		@user = current_user
		@result = Result.new
		@result.name = params[:topic_id]
		@result.lab = params[:lab]
		if (@result.name.eql?("") && @result.lab.eql?(""))
			@questions = Question.all.order(user_id: :desc)
		elsif @result.name.eql?("")
			@questions = Question.where(:lab => @result.lab).order(user_id: :desc)
		elsif @result.lab.eql?("")
			@questions = Question.where(:topic_id => @result.name).order(user_id: :desc)
		else
			@questions = Question.where(:topic_id => @result.name, :lab => @result.lab).order(user_id: :desc)
		end
	end

	private
		def result_params
			params.require(:result).permit(:name, :lab)
		end
end