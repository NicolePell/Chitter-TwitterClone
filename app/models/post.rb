require 'data_mapper'

class Post

	include DataMapper::Resource

	property :id, Serial
	property :user_name, String 
	property :post, String, length: 140
end