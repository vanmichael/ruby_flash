require 'spec_helper'

feature 'sign up', %q{
  As an authenticated user
  I want to sign out
  So that I am not logged in.
} do

  #Acceptance Criteria
  # * I must have a link to sign out
  # * I must be redirected to my root path
  # * The session is ended

  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
      sign_in_as(user)
  end

  scenario 'Signing Out' do
    visit root_path
    click_link 'Sign Out'
    expect(page).to have_content("Signed out successfully.")
    current_path.should == root_path
  end

end
