require 'spec_helper'

feature 'member creates new card', %q{
	As a group member
	I want to create a card
	So that I can contribute to flash cards
} do

	# As a member
	# I want to create a card
	# So that I can contribute flash cards

	# Acceptance Criteria:
	# * The member should be able to find a form on the group page.
	# * The card should show who it was last updated by.
	# * The member should be able to set a title.
	# * The member should be able to set a question.
	# * The member should be able to set a answer.
	# * The member should be able to select a topic.
	# * The member should be able to select a group.

	let(:user) {FactoryGirl.create(:user)}

	before(:each) do
		sign_in_as(user)
	end

	scenario 'specifying valid and required information, adds new flash card' do
		group = FactoryGirl.create(:group, name: 'Capybara')
		card_title = 'Expectation'
		card_question = 'What is an expectation'
		card_answer = 'Methods used to verify in tests.'

		visit group_path(group)

	 	fill_in 'Title of card', with: card_title
	 	fill_in 'Question', with: card_question
	 	fill_in 'Answer', with: card_answer
	 	select '20', from: 'Topic'

	 	click_button 'Create Card'

	 	expect(page).to have_content("Card Created!")
	 	expect(page).to have_content("Capybara")
	end

	scenario 'specifying invalid required information, get error' do
		group = FactoryGirl.create(:group, name: 'Capybara')
		visit group_path(group)
		click_button 'Create Card'
		expect(page).to have_content("Card Not Created!")
	end
end
