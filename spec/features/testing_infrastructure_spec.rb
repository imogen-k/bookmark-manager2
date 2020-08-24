feature 'testing infrastructure' do
  scenario 'displays bookmark manager' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
