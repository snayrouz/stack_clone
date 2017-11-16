require 'rails_helper'

describe "the log in process", :type => :feature do
  User.create(username: 'sam', email: 'sam@example.com', password: 'password')
  it " user logs in" do
    visit login_path

    within ".new_user" do
      fill_in 'Username', :with => 'sam'
      fill_in 'Password', :with => 'password'
      click_button 'Log In!'
    end

    visit root_path

    expect(page).to have_link('Logout', href: '/logout')
  end
end
