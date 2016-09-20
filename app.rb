require "sinatra"
require "sinatra/reloader"
require "data_mapper"
use Rack::MethodOverride

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/app.db")

class Message
  include DataMapper::Resource
  property :id, Serial
  property :email, String, :required => true
  property :full_name, String, :required => true
  property :content, Text, :required => true
end

DataMapper.auto_upgrade!

get "/" do
  erb :home, layout: :resume_layout
end