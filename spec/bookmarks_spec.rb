require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '#.all' do
    it 'returns all bookmarks stored in class' do
      con = PG.connect :dbname => 'bookmark_manager_test'
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#.create' do
    it 'adds a bookmark to database' do
      bookmark = Bookmark.create(url:'www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq('www.testbookmark.com')
      expect(bookmark.title).to eq('Test Bookmark')
    end
  end

  describe '#.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url:'www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '#.update' do
    it 'updates the bookmark with the given data' do
    bookmark = Bookmark.create(title: 'Makers Academy', url: 'www.makersacademy.com')
    updated_bookmark = Bookmark.update(id: bookmark.id, url: 'www.testsite.com', title: 'Test')

    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Test'
    expect(updated_bookmark.url).to eq 'www.testsite.com'
  end
end

  describe '#.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Reddit', url: 'http://www.reddit.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Reddit'
      expect(result.url).to eq 'http://www.reddit.com'
    end
  end

end
