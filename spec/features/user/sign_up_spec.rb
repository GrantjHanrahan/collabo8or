require 'rails_helper'

RSpec.feature "Sign up", :type => :feature do
  # Devise's build method has been used instead of create
  let(:user) { build(:user) }

  # simulate a user navigating to the signup page. filling in the form, submitting the form and finally, expect to see the #user-settings element which is available only for logged in users
  scenario 'user navigates to sign up page and successfully signs up', js: true do
    visit root_path
    find('nav a', text: 'Signup').click
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]',  with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('.sign-up-button').click
    expect(page).to have_selector('#user-settings')
  end
end
