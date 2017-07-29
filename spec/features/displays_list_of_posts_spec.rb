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
end
