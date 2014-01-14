require 'spec_helper'

feature 'member can update a card', %q{
	As a group member
	I want to update a card
	So that I can correct a card
} do

	# As a member
	# I want to update a card
	# So that I can correct a card

	# Acceptance Criteria:
	# * The member should be able to find a update form
	# * The card should show who it was last updated by
	# * The member should be able to update a title.
	# * The member should be able to update a question.
	# * The member should be able to update a answer.
	# * The member should be able to update a topic.

	let(:user) {FactoryGirl.create(:user)}

	before(:each) do
		sign_in_as(user)
	end

	scenario 'updating a card with valid information' do
		group = FactoryGirl.create(:group, name: 'Capybara')
		card = FactoryGirl.create(:card, group_id: group.id)
		card.answer = "awesome"

		click_link "Edit"
	    #visit edit_card_path(card)
	    expect(page).to have_content('Edit')
	    fill_in "Answer", with: card.answer
	    
	end


end