require 'sinatra'
require 'sinatra/reloader'
require_relative'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new
$rolodex.add_contact("1000", "John","Marshall","john.marshall@ucc.on.ca","chill guy")

contact = $rolodex.find(1000)



get '/' do
  @crm_app_name = "My CRM"
  @date = Time.now.to_s
  erb :index
end

post '/contacts' do
  $rolodex.add_contact(params[:highest_id], params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get'/contacts/new' do
  erb :new_contact
end

get '/contacts' do
  @contacts = $rolodex.all
  erb :contacts
end

get '/contacts/1000' do
  @contact = $rolodex.find(1000)
  erb :show_contact
end


