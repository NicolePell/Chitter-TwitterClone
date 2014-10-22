require 'spec_helper'

feature "User browses the list of posts" do
	
	before(:each) {
		
		Post.create( 	user_name: '@nic',
									post: 'BEST POST EVER')
	}

	scenario "When visiting the homepage" do
		visit '/'
		expect(page.status_code).to eq 200
		expect(page).to have_content('BEST POST EVER')
	end
end
