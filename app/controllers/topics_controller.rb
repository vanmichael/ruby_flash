class TopicsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_card, only: [:show, :edit, :update, :destroy]

	def index
		@topics = Topic.new
	end

	def new
		@topic = Topic.new
	end 

	def create
		@topic = Topic.new(topic_params)

		respon_to do |format|
			if @topic.save
				
			else

			end
	end

	def show

	end

	def edit

	end

	def update

	end

	def destroy

	end
end