require 'rails_helper'

feature 'Editing posts' do

  background do
    post = create(:post)
    user = create :user

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario "User can edit a post" do
    fill_in 'Caption', with: "Test"
    click_button 'Update Post'
    expect(page).to have_content("Test")
    expect(page).to have_content("Post updated!")
  end
end
