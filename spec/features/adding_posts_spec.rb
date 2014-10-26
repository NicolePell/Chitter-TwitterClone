require 'spec_helper'

feature "User adds a new post" do

	scenario "when browsing the homepage" do
		expect(Post.count).to eq(0)
		visit '/'
		sign_in('nic@pell', 'fairytail')
		add_post('AN EVEN BETTER POST THAN THE BEST POST', '@nic')
		expect(Post.count).to eq(1)
		post = Post.first
		expect(post.post).to eq('AN EVEN BETTER POST THAN THE BEST POST', '@nic')
		
	end

	def add_post(post, user_name)
		within('.new-post') do
			# sign_in('nic@pell.com', 'fairytail')
			fill_in 'post', with: 'AN EVEN BETTER POST THAN THE BEST POST'
			fill_in 'user_name', with: '@nic'
			click_button 'Post'
		end
	end
end