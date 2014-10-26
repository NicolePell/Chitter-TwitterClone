require 'spec_helper'

feature "User adds a new post" do

		before(:each) {
		
		User.create( 	email: "nic@pell.com",
								user_name: "@nic",
								password: "fairytail",
								password_confirmation: "fairytail")
	}

	scenario "when browsing the homepage" do
		expect(Post.count).to eq(0)
		visit '/'
		add_post('AN EVEN BETTER POST THAN THE BEST POST')
		expect(Post.count).to eq(1)
		post = Post.first
		expect(post.post).to eq('AN EVEN BETTER POST THAN THE BEST POST')
		
	end

	

end