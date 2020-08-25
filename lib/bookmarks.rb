require 'pg'

class Bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
    con = PG.connect :dbname => 'bookmark_manager'
    end
    bookmarks = con.exec "SELECT * FROM bookmarks"

    bookmarks.map { |bookmark| bookmark['url'] }

  end


end
