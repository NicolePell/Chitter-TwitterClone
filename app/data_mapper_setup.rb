require 'data_mapper'
require_relative 'models/post'
require_relative 'models/user'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!