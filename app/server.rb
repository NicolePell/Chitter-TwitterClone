require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'
require_relative 'helpers/session'
require_relative 'models/post'
require_relative 'models/user'

require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/posts'



include SessionHelpers

set :views, Proc.new { File.join(root, "views") }
enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb