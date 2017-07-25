require 'sinatra/base'
require_relative 'models/link'
require 'database_cleaner'


class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello world!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    p link
    redirect '/links'
  end
end
