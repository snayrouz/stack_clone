require 'rails_helper'

describe "User logs in to chat" do
  User.create(username: 'sam', email: 'sam@example.com', password: 'password')
  it "they login and visit the chat page" do
    visit login_path

    within ".new_user" do
      fill_in 'Username', :with => 'sam'
      fill_in 'Password', :with => 'password'
      click_button 'Log In!'
    end

    expect(current_path).to eq(questions_path)
    expect(page).to have_link('Logout', href: '/logout')
    expect(page).to have_link("Chat")
    click_on "Chat"

    expect(current_path).to eq(chat_index_path)

    expect(page).to have_content("Welcome to Turing Chat")
    expect(page).to have_content("Code of Conduct")
  end
end
