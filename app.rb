require 'rubygems'
require 'sinatra/base'
require 'haml'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  get '/' do
    haml :index
  end

run! if app_file == $0
end
