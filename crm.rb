require 'sinatra'
require 'sinatra/reloader'
require_relative'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

contact = $rolodex.find(1000)



get '/' do
  @crm_app_name = "My CRM"
  @date = Time.now.to_s
  erb :index
end

post '/contacts' do
  $rolodex.add_contact(params[:id], params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get'/contacts/new' do
  erb :new_contact
end

get '/contacts' do
  @contacts = $rolodex.all
  erb :contacts
end

get '/contacts/:id' do
  if @contact = $rolodex.find(params[:id].to_i)
  erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  if @contact = $rolodex.find(params[:id].to_i)
  erb :edit_contact
   else
    raise Sinatra::NotFound
  end
end





