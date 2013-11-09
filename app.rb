require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'pony'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  get '/' do
    haml :index
  end

  post '/' do
    require 'pony'
    Pony.mail(
      from: "#{params[:email]}",
      to: "massoma7@yahoo.com",
      subject: 'Ensemble Solutions contact',
      body: "#{params[:message]}",
      port: '587',
      enable_starttls_auto: true,
      user_name:  ENV['SENDGRID_USERNAME'],
      password:  ENV['SENDGRID_PASSWORD'],
      authentication: :plain,
      domain:  'heroku.com'
      )
  end

run! if app_file == $0
end
