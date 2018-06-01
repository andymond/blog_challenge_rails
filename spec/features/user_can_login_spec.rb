require 'rails_helper'

describe 'as a user' do
  it 'can login to account from home page' do
    User.create(username: "larry", email: "test@email.com", password: "password")

    visit root_path

    fill_in "username", with: "larry"
    fill_in "password", with: "password"
    click_on "log in"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("welcome larry")
  end
end
