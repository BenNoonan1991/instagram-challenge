require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images.jpeg")
    fill_in 'Caption', with: '#London Skyline'
    click_button 'Create Post'
    expect(page).to have_content('#London Skyline')
    expect(page).to have_css("img[src*='images.jpeg']")
  end
end
