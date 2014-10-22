require 'spec_helper'
require 'post'

describe Post do
	
	context 'Checking datamapper is working' do

		it 'should be created and retrieved from the database' do
			expect(Post.count).to eq(0)

			Post.create( 	email: 'nic@pell.com', 
										name: 'Nic',
										user_name: '@nic',
										post: 'BEST POST EVER')
			expect(Post.count).to eq(1)

			post = Post.first

			expect(post.email).to eq('nic@pell.com')
			expect(post.name).to eq('Nic')
			expect(post.user_name).to eq('@nic')
			expect(post.post).to eq('BEST POST EVER')

			post.destroy

			expect(Post.count).to eq(0)
		end
	end
end