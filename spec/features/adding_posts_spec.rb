require 'spec_helper'

feature "User adds a new link" do
	scenario "when browsing the homepage" do
		expect(Post.count).to eq(0)
		visit '/'
		add_post('AN EVEN BETTER POST THAN THE BEST POST')
		expect(Post.count).to eq(1)
		post = Post.first
		expect(post.post).to eq('AN EVEN BETTER POST THAN THE BEST POST')
		
	end

	def add_post(post)
		within('#new-post') do
			fill_in 'post', with: post
			click_button 'Post'
		end
	end
end