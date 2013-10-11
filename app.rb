require 'rubygems'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack

  enable :inline_templates

  assets do
    serve '/js',    from: 'app/js'
    serve '/css',    from: 'app/css'
    serve '/image',    from: 'app/image'

    css :cssapp, [
      '/css/*.css'
    ]

    js :jsapp, [
      '/js/*.js',
      '/js/*/*.js'
    ]

    css_compression :simple
    js_compression :simple
  end

  get '/' do
    haml :index
  end

run! if app_file == $0
end
