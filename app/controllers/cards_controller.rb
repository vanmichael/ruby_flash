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
		respond_to do |format|
			if @card.save
				format.html { redirect_to group_path(group), notice: "Card Created!"}
			else
				format.html { redirect_to :back, notice: "Card Not Created!" }
			end
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

	private

	def set_card
		@card = Card.find(params[:id])
	end

	def card_params
		params.require(:card).permit(:title, :question, :answer, :topic_id)
	end

end
