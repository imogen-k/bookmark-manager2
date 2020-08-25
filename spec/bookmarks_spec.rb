require 'bookmarks'

describe Bookmarks do

  describe '#.all' do
    it 'returns all bookmarks stored in class' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '#.create' do
    it 'adds a bookmark to database' do
      Bookmarks.create('www.monzo.com')
      expect(described_class.all).to include('www.monzo.com')
    end
  end

end
