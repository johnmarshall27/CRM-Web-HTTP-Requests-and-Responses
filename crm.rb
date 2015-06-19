require 'sinatra'
require 'data_mapper'
require 'sinatra/reloader'
require_relative 'rolodex'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String
end

  DataMapper.finalize
  DataMapper.auto_upgrade!


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

put "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")

  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    $rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end





