class TopicsController < ApplicationController
	before_filter :authenticate_user!
	helper_method :sort_column, :sort_direction

	def index
		#@topics = Topic.all
		@topics = Topic.search(params[:search]).order(sort_column + " " + sort_direction)
	end

	def create
		@topic = Topic.new(topic_params)
	end

	def show
		@topic = Topic.find_by_name(params[:id]) || Topic.find(params[:id])
		@cards = @topic.cards
	end

	private

	def sort_column
    Topic.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
