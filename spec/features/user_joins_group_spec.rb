require 'spec_helper'


feature 'user becomes a member of a group', %q{
  As a user
  I want to join a group
  So that I can contribute as a member
} do

  # As a user
  # I want to join a group
  # So that I can contribute flash cards

  # Acceptance Criteria:
  # * I am an authenticated signed in user

  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group) }
  let(:membership) { FactoryGirl.create(:membership) }

  before(:each) do
    sign_in_as(user)
  end

  scenario 'an authenticated user can join a group' do

    visit root_path
    click_link 'Groups'

    visit group_path(group)
    expect(page).to have_content(group.name)
    click_button 'Join'
  end

  scenario 'an existing member can not join a group' do
    membership.user_id = user.id
    membership.group_id = group.id
    membership.save

    visit root_path
    click_link 'Groups'
    visit group_path(group)
    expect(page).to have_button('Leave')
  end

end


