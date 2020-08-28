require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up the connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'stays connected' do
      con = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq con
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      con = DatabaseConnection.setup('bookmark_manager_test')
      expect(con).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
