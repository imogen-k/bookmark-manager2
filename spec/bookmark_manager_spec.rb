require 'bookmark_manager'

describe BookmarkManager do

  describe '#.all' do
    it 'returns all bookmarks stored in class' do
      expect(described_class.all).to include('www.google.com')
    end
  end

end
