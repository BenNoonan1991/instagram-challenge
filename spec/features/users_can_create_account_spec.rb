require 'rails_helper'

feature 'Creating a new user' do

  background do
    visit '/'
    click_link 'Register'
  end

  scenario "New users can create an accout" do
    fill_in 'User name', with: "Test_name"
    fill_in 'Email', with: "test@example.com"
    fill_in('Password', with: "123456", :match => :prefer_exact)
    fill_in('Password confirmation', with: "123456", :match => :prefer_exact)
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully")
  end
end
