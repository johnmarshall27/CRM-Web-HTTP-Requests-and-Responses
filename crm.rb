require 'sinatra'
require_relative'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  @date = "06/16/2015"
  erb :index
end

get '/contacts' do
  erb :contacts
end

