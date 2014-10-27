require 'rails_helper'

feature "Accounts" do

  scenario "creating an account" do

    visit subscriber.root_path
    click_link "Account Sign Up"

    fill_in "Name", :with => "Test"
    fill_in "Subdomain", :with => "test"
    fill_in "Email", :with => "subscriber@example.com"
    fill_in "Password", :with => "password", :exact => true
    fill_in "Password confirmation", :with => "password"

    click_button "Create Account"

    success_message = "Your account has been successfully created."

    expect(page).to have_content(success_message)
  end
end
