class WelcomeController < ApplicationController

	def index

	end

  def quiz
    @topics = Topic.all
  end

end
