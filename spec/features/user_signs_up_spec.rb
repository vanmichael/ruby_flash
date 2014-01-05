require 'spec_helper'

feature 'sign up', %q{
	As an unauthenticated user
	I want to sign up
	So that I can practice ruby flash cards
} do

	# Acceptance Criteria
	# * I must specify a first name
	# * I must specify a last name
	# * I must specify a password, and confirm that password
	# * If any of the above are blank, I get an error message
	# * If I specify valid information, I register my account and am authenticated

	scenario 'specifying valid and required information' do
		visit root_path
		click_link 'Sign Up'
		fill_in 'First Name', with: 'Van'
		fill_in 'Last Name', with: 'Nguyen'
		fill_in 'Email', with: 'vnguyen6@babson.edu'
		fill_in 'user_password', with: 'password'
		fill_in 'Password Confirmation', with: 'password'
		click_button 'Sign Up'

		expect(page).to have_content("You Logged in successfully!")
		expect(page).to have_content("Sign Out")
	end

	scenario 'required information is not supplied' do
		visit root_path
		click_link 'Sign Up'
		click_button 'Sign Up'

		expect(page).to have_content("can't be blank")
		expect(page).to_not have_content("Sign Out")
	end

	scenario 'password confirmation does not match confirmation' do
		visit root_path
		click_link 'Sign Up'

		fill_in 'user_password', with: 'password'
		fill_in 'Password Confirmation', with: 'somthing different'
		
		click_button 'Sign Up'

		expect(page).to have_content("doesn't match")
		expect(page).to_not have_content("Sign Out")

	end

end