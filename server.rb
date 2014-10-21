require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/post'


DataMapper.finalize
DataMapper.auto_upgrade!

set :views, Proc.new { File.join(root, "views") }