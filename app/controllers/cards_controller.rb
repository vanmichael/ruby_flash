class CardsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_card, only: [:show, :edit, :update, :destroy]

	def index
		@cards = Card.all
	end

	def new
		@card = Card.new
	end

	def create
		group = Group.find(params[:group_id])
		@card = group.cards.build(card_params)
		if @card.save
			redirect_to group_path(group), notice: "Card Created!"
		else
			redirect_to :back, alert: "Card Not Created!"
		end
	end

	def edit

	end

	def update
		group = Group.find(@card.group_id)
		if @card.update_attributes(card_params)
			redirect_to group_path(group), notice: "Card Updated!"
		else
			redirect_to :back, alert: "Card Not Updated!"
		end
	end

	def destroy

	end

	private

	def set_card
		@card = Card.find(params[:id])
	end

	def card_params
		params.require(:card).permit(:title, :question, :answer, :topic_list)
	end

end
