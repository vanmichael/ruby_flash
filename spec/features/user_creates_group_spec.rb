require 'spec_helper'

feature 'user creates new group', %q{
	As a user
	I want to create a new group
	So that I can invite contributors
} do

	# As a user
	# I want to create a group
	# So that I can invite new group members

	# Acceptance Criteria:
	# * The user should be able to find a link to create a group deck.
	# * The user should be able to invite other users to the group.
	# * The user's should be able to set a topic name for the flashcard deck.

	scenario 'specifying valid and required information, adds new group' do
		ActionMailer::Base.deliveries = []

		email = 'to@example.org'

		visit root_path
		click_link 'Groups'
		fill_in 'Group Name', with: 'Ruby Enumerables'
		click_button 'Create Group'

		expect(page).to have_content("Group created!")

		expect(ActionMailer::Base.deliveries.size).to eql(1)
		last_email = ActionMailer::Base.deliveries.last
		expect(last_email).to have_subject('Group Creation Confirmed')
		expect(last_email).to deliver_to(email)

	end
end

