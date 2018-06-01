require "rails_helper"

describe "Logged in user" do
  it "can create a new blog post" do
    User.destroy_all
    user = User.create(username: "captain", password: "topsecret", email: "yourmomsemail@whatever.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    click_on "create new blog post"

    expect(current_path).to eq(new_post_path)

    fill_in "post_body", with: "this is a cool new thing"
    click_on "Create Post"

    expect(current_path).to eq(posts_path)
    expect(page).to have_content("this is a cool new thing")
    expect(page).to have_content("captain")
  end
end
