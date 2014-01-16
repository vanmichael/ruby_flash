class WelcomeController < ApplicationController

	def index

	end

  def quiz
    @cards = Card.all
  end

end
