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
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get'/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  puts params
end

