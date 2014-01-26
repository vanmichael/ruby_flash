require 'spec_helper'

feature 'User can search a topic', %q{
  As a User
  I want to be able to search a topic
  So that I can views cards related to that topic
} do

  # As a user
  # I want to search a topic
  # So that I can browse cards related to that topic

  # Acceptance Criteria:
  # * The user should be able to find a link to view topics.
  # * The user should be able view cards related to a topic.

  let(:user) { FactoryGirl.create(:user) }
  let(:card) { FactoryGirl.create(:card) }
  let(:topic) { FactoryGirl.create(:topic) }
  let(:tagging) { FactoryGirl.create(:tagging) }

  before(:each) do
    sign_in_as(user)
  end

  scenario 'view cards associated to a specific topic' do
    tagging.card_id = card.id
    tagging.topic_id = topic.id
    tagging.save

    visit root_path
    click_link 'Topics'
    expect(page).to have_content('Topics')
    fill_in 'search', with: 'enumerables'
    expect(page).to have_content(topic.name)
    visit topic_path(topic)

    expect(page).to have_content(card.title)
  end

end
