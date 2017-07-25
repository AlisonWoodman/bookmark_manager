ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require 'database_cleaner'
require_relative 'data_mapper_setup'


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
    Link.create(title: params[:title], url: params[:url])
    tag  = Tag.first_or_create(title: params[:tag])
    redirect '/links'
  end
end
