require 'spec_helper'

feature 'User signs up' do
	
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, @nic")
		expect(User.first.email).to eq("nic@pell.com")
		expect(User.first.user_name).to eq("@nic")
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up('nic@pell.com', 'pass', 'wrong') }.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("This email is already registered")
	end

	def sign_up(email = "nic@pell.com",
							user_name = "@nic",
							password = "fairytail",
							password_confirmation = "fairytail")
			visit 'users/new'
			expect(page.status_code).to eq(200)
			fill_in :email, with: email
			fill_in :user_name, with: user_name
			fill_in :password, with: password
			fill_in :password_confirmation, with: password_confirmation
			click_button "Sign up"
	end

end