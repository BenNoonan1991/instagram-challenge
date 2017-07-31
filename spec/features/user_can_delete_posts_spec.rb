require 'rails_helper'

feature 'Deleting posts' do
  background do  
    user = create :user
    post = create(:post, caption: 'Test')

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'User can delete a post' do
    click_link 'Delete Post'
    expect(page).to_not have_content('Test')
    expect(page).to have_content('Post deleted')
  end
end
