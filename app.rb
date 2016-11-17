require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model'
set :port, 9494
get '/' do
  erb :index
end

post '/submit' do
	@model = Model.new(name: params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end

get '/models' do
	@models = Model.all
	erb :models
end
