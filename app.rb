require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'pony'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  configure :production do
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }
  end


  get '/' do
    haml :index
  end

  post '/send' do
    Pony.mail(
      from: "#{params[:email]}",
      to: "massoma7@yahoo.com",
      subject: "Ensemble Solutions contact from #{params[:name]}",
      body: "#{params[:message]}"
    )
  end

run! if app_file == $0
end
