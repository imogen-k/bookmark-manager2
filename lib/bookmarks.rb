require 'pg'

class Bookmarks

  def self.all

    con = PG.connect :dbname => 'bookmark_manager'

    bookmarks = con.exec "SELECT * FROM bookmarks"

    bookmarks.map { |bookmark| bookmark['url'] }

  end


end
