require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'User can log in' do
    visit '/'
    expect(page).to_not have_content('New Post')
    click_link 'Log in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'User can log out' do
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  scenario 'User cannot post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
