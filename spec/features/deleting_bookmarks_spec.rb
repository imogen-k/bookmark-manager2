feature 'Deleting an already existing bookmark' do
  scenario 'can click delete button next to link' do
    Bookmark.create(url: 'www.testbookmark.com', title: 'Test Bookmark')
    visit '/bookmarks'
    expect(page).to have_link('Test Bookmark', href: 'www.testbookmark.com')
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Test Bookmark', href: 'www.testbookmark.com')
  end
end
