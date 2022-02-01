require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry'

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  id = params["id"].to_i
  @restaurant = Restaurant.find(id)
  erb :show
end

post '/restaurants' do
  resto = Restaurant.new(
    name: params["name"],
    city: params["city"],
    rating: 0
  )
  resto.save
  redirect "/"
end
