feature 'Updating an already existing bookmark' do
  scenario 'can click update button next to link' do
    bookmark = Bookmark.create(url: 'www.testbookmark.com', title: 'Test Bookmark')
    visit '/bookmarks'
    expect(page).to have_link('Test Bookmark', href: 'www.testbookmark.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in :url, with: 'www.newurl.com'
    fill_in :title, with: 'New title'
    click_button('Update')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Test Bookmark', href: 'www.testbookmark.com')
    expect(page).to have_link('New title', href: 'www.newurl.com')
  end
end
