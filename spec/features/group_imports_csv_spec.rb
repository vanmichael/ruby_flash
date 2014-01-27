require 'spec_helper'

feature 'Group can import a csv', %q{
  As a group member
  I want to import a csv
  So that I can convert the rows into flash cards
} do

  # As a Group member
  # I want to import a csv
  # So that I can convert the rows into flash cards

  # Acceptance Criteria:
  # * The user should be able to find a button for importing.
  # * The user should not be allowed to import other file types.

  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group) }

  before(:each) do
    sign_in_as(user)
  end

  scenario 'should import a valid csv' do
    visit group_path(group)
    page.find("#file").click
    attach_file "file", Rails.root.to_s + '/spec/support/sample.csv'
    click_button("Import CSV")

    expect(page).to have_content("Cards Added From CSV Successfully!")
    expect(page).to have_content("Array")
    expect(page).to have_content("What is an Array?")
  end

  scenario 'should not import invalid file type' do
    visit group_path(group)
    page.find("#file").click
    attach_file "file", Rails.root.to_s + '/spec/support/wrong_file_type.rtf'
    click_button("Import CSV")

    expect(page).to have_content("Sorry invalid file type!")
  end

  scenario 'should not import invalid headers' do
    visit group_path(group)
    page.find("#file").click
    attach_file "file", Rails.root.to_s + '/spec/support/invalid_headers.csv'
    click_button("Import CSV")

    expect(page).to have_content("Sorry invalid headers!")
  end

  scenario 'should not submit form without adding CSV' do
    visit group_path(group)
    page.find("#file").click
    click_button("Import CSV")

    expect(page).to have_content("Please attach a valid file!")
  end

end
