require 'bookmarks'

describe Bookmarks do

  describe '#.all' do
    it 'returns all bookmarks stored in class' do

      con = PG.connect :dbname => 'bookmark_manager_test'

      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com'); ")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com'); ")
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '#.create' do
    it 'adds a bookmark to database' do
      Bookmarks.create(url:'www.monzo.com')
      expect(described_class.all).to include('www.monzo.com')
    end
  end

end
