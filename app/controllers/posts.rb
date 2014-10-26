get '/' do
	@posts = Post.all

	erb :index
end

post '/posts' do
	post = params["post"]
	# user = 
	Post.create(post: post)
	redirect to('/')
end