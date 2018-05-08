require 'rails_helper'

# feature and scenario are part of Capybara's syntax, feature => context/ describe, scenario => it
RSpec.feature "Login", :type => :feature do
  # the let method allows to write memorized methods which can be used across all specs within the context that the method was defined
  let(:user) { create(:user) }

  # simulating a visit to the login page, starting from the home page. The form is filled and then submitted. A check is performed if the #user-settings element on the navigation bar, which is available only for signed in users
  # js: true argument allows to test functionailities which involves JavaScript
  scenario 'user navigates to the login page and successfully logs in', js: true do
    user
    visit root_path
    find('nav a', text: 'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login-button').click
    expect(page).to have_selector('#user-settings')
  end
end
