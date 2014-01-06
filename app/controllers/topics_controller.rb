class TopicsController < ApplicationController
	def show
		@user = current_user
		@topic = Topic.new
		@topics = Topic.all
	end

	def create
		@user = current_user
		if @user.assistant || @user.instructor
			@topic = Topic.create(topic_params)
			@topic.save
		end
		redirect_to "/topics"
	end

	def remove
		@user = current_user
		if @user.assistant || @user.instructor
			@topic = Topic.find_by(topic_id: params[:id])
			if(!@topic.nil?)
				@topic.delete
			end
		end
		redirect_to "/topics"
	end

	private 

	def topic_params
		params.require(:topic).permit(:name)
	end
end