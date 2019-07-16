#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

before do
  @products = Product.all
  @orders = Order.all
end

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base

  validates :name, presence: true, length: {minimum: 2}
  validates :phone, presence: true, length: {minimum: 6}
  validates :address, presence: true

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

get '/cart' do

  erb :cart
end

post '/cart' do

  #получаем список параметров и разбираем их (parse)

  @orders_input = params[:orders_input]
  @items = parse_orders_input @orders_input
#выводим сообщение о том что корзина пустая
  if @items.length == 0
    return erb :cart_is_empty
  end
#выводим список продуктов в корзине
  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  #возврашаем значение по-умолчанию

  erb :cart
end

def parse_orders_input orders_input
  s1 = orders_input.split(/,/)

  arr = []
  s1.each do |x|
    s2 = x.split(/\=/)
    s3 = s2[0].split(/_/)

    id = s3[1]
    cnt = s2[1]

    arr2 = [id, cnt]

    arr.push arr2
  end

  return arr
end

get '/order' do

  erb :order
end

post '/order' do

  erb :order
end

get '/place_order' do

  erb :place_order
end

post '/place_order' do

  @o = Order.new params[:orders_input]
  @o.save

  if @o.save
    erb :order_placed
  else
    @error = @o.errors.full_messages.first
  end
end

get '/activeorders' do
  erb :activeorders

end

post '/activeorders' do
  erb :activeorders


end

get '/cart_is_empty' do
  erb :cart_is_empty
end

post '/cart_is_empty' do
  erb "заглушка"
end
