require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/add' do
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
