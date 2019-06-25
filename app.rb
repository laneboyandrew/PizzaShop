#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

before do
  @products = Product.all
end

class Product < ActiveRecord::Base

end

get '/' do
	erb :index
end

get'/about' do
  erb :about
end

get '/pizza' do
  erb :pizza
end
