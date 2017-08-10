require 'rails_helper'

feature 'Creating posts' do
  background do
    user = create :user
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'can create a post' do
    visit '/'
    click_link 'New post'
    attach_file('Image', "spec/files/images.jpeg")
    fill_in 'Caption', with: '#London Skyline'
    click_button 'Create Post'
    expect(page).to have_content('#London Skyline')
    expect(page).to have_css("img[src*='images.jpeg']")
    expect(page).to have_content('Ben')
  end

  scenario 'posts must contain an image' do
    visit '/'
    click_link 'New post'
    fill_in 'Caption', with: "#Test"
    click_button 'Create Post'
    expect(page).to have_content('Your new post couldn\'t be created')
    end
end
