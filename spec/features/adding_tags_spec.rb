require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

feature 'Adding tags' do
  scenario 'I can agg tags to my saved links' do
    visit ('/links/new')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    fill_in('tag', with: 'Education')
    click_button 'Submit'
    expect(page).to have_content 'Education'
  end
end

DatabaseCleaner.clean
