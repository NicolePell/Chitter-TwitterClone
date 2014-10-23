require 'spec_helper'

feature "User adds a new link" do
	scenario "when browsing the homepage" do
		expect(Post.count).to eq(0)
		visit '/'
		add_post('@nic', 'AN EVEN BETTER POST THAN THE BEST POST')
		expect(Post.count).to eq(1)
		post = Post.first
		expect(post.post).to eq('AN EVEN BETTER POST THAN THE BEST POST')
		expect(post.user_name).to eq('@nic')
	end

	def add_post(user_name, post)
		within('#new-post') do
			fill_in 'post', with: post
			fill_in 'user_name', with: user_name
			click_button 'Post'
		end
	end
end