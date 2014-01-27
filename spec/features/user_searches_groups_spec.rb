require 'spec_helper'

feature 'User can search a group', %q{
  As a User
  I want to be able to search for a group
  So that I can views cards related to that group.
} do

  # As a user
  # I want to search for a group
  # So that I can contribute or view cards related to that group.

  # Acceptance Criteria:
  # * The user should be able to find a link to view groups.
  # * The user should be able view cards related to a group.

  let(:user) { FactoryGirl.create(:user) }
  let(:card) { FactoryGirl.create(:card) }
  let(:group) { FactoryGirl.create(:group) }

  before(:each) do
    sign_in_as(user)
  end

  scenario 'view cards associated to a specific searched group' do
    group.name = 'Ruby Group'
    group.save

    visit root_path
    click_link 'Groups'
    expect(page).to have_content('Groups')
    fill_in 'search', with: group.name
    click_button 'Search'
    expect(page).to have_content(group.name)
  end

end
