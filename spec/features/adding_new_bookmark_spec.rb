feature 'adding bookmark' do
  scenario 'types url into form and submits' do
    visit '/bookmarks'
    fill_in :url, with: 'www.monzo.com'
    click_button 'Add'
    expect(page).to have_content('www.monzo.com')
  end
end
