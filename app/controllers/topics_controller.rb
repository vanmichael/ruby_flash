class TopicsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topic_params)

	end

	def show
		@topic = Topic.find_by_name(params[:id]) || Topic.find(params[:id])
		@cards = @topic.cards
	end
end
