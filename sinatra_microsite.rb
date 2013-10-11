require 'rubygems'
require 'sinatra/base'

class SinatraMicrosite < Sinatra::Base

  get '/' do
    'Yo mundo'
  end

run! if app_file == $0
end
