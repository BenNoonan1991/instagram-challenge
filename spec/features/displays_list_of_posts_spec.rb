require 'rails_helper'

feature 'Index displays list of posts' do
  scenario 'User can see a list of posts in the index' do
    post_one = create(:post, caption: "Post 1")
    post_two = create(:post, caption: "Post 2")

    visit '/'
    expect(page).to have_content("Post 1")
    expect(page).to have_content("Post 2")
    expect(page).to have_css("img[src*='images.jpeg']")
  end

  scenario 'Clicking on image in index takes user to original post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
