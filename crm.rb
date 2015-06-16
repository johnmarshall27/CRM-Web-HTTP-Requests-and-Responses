require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  @date = "06/16/2015"
  erb :index
end

get '/contacts' do
  erb :contacts
end
