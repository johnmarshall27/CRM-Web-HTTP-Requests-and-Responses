require 'sinatra'
require_relative'contact'

get '/' do
  @crm_app_name = "My CRM"
  @date = "06/16/2015"
  erb :index
end

get '/contacts' do
  @contacts = []
  @contacts << Contact.new("john", "Marshall","john.marshall@ucc.on.ca", "Developer")
  @contacts << Contact.new("john1", "Marshall1","john.marshall1@ucc.on.ca", "Developer1")
  @contacts << Contact.new("john2", "Marshall2","john.marshall2@ucc.on.ca", "Developer2")
  erb :contacts
end

