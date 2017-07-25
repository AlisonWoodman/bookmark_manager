require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

feature 'Creating links' do
  scenario 'I can save links in my bookmark manager' do
    visit ('/links/new')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    click_button 'Submit'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end

DatabaseCleaner.clean
