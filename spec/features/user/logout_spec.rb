require 'rails_helper'

RSpec.feature "Logout", :type => :feature do
  let(:user) { create(:user) }

  # This scenario simulates a user clicking the logout button and then expects to see non-logged in user's links on the navigation bar
  # the sign_in method is one of the Devise helper methods
  scenario 'user successfully logs out', js: true do
    sign_in user
    visit root_path
    find('nav #user-settings').click
    find('nav a', text: 'Log out').click
    expect(page).to have_selector('nav a', text: 'Login')
  end
end
