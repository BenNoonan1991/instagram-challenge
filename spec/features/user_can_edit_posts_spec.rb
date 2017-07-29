require 'rails_helper'

feature 'Editing posts' do

  background do
    post = create(:post)

    visit '/'
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
