require 'rails_helper'

feature 'Index displays list of posts' do
  background do
    user = create :user
    post_one = create(:post, caption: "Post 1", user_id: user.id)
    post_two = create(:post, caption: "Post 2", user_id: user.id)

    sign_in_with user
  end

  scenario "Users can see a list of posts" do
    expect(page).to have_content("Post 1")
    expect(page).to have_content("Post 2")
    expect(page).to have_css("img[src*='images.jpeg']")
  end
end

  
