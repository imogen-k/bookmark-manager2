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

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "INSERT INTO bookmarks (url) VALUES ('#{url}');"
  end


end
