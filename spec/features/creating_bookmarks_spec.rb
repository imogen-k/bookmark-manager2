feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in :url, with: 'www.testbookmark.com'
    fill_in :title, with: 'Test Bookmark'
    click_button 'Add'
    expect(page).to have_link('Test Bookmark', href: 'www.testbookmark.com')
  end
end
