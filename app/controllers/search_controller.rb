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
		@questions = Question.where(:topic_id => @result.name, :lab => @result.lab)
	end


	private
		def result_params
			params.require(:result).permit(:name, :lab)
		end
end