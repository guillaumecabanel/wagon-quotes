require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "config/application.rb"

set :views, proc { File.join(root, "app/views") }
set :bind, '0.0.0.0'



get '/' do
  @quotes = Quote.order(votes: :desc)
  erb :quotes
end

post '/quotes' do
  Quote.create(
    value: params[:value],
    author:  params[:author]
  )

  redirect to('/')
end

patch '/quotes/:id' do
  quote = Quote.find(params[:id])
  quote.votes += 1
  quote.save

  redirect to('/')
end
