require 'rails_helper'

describe 'as a user' do
  it 'can login to account from home page' do
    User.create(username: "larry", email: "test@email.com", password: "password")

    visit root_path

    fill_in "username", with: "larry"
    fill_in "password", with: "password"
    click_on "log in"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome larry")
  end

  it 'can log out of account' do
    user = User.create(username: "larry", email: "test@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path
    click_on "log out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You have logged out.")
  end
end
