require 'rails_helper'

RSpec.feature "Users", type: :feature do
  
  def signup
  	fill_in 'Name', :with =>'Ali'
  	fill_in 'Email', :with => 'example@mail.com'
  	fill_in 'Password', :with => 'Password!'
  	fill_in 'Confirmation', :with => 'Password!'
  end

  scenario 'User creates a new account' do 
  	visit '/signup'

  	signup

  	expect(page).to have_css('#pswd-strength-txt')
  	expect(page).to have_css('#pswd-feedback')

  	click_button 'Create my account'

  	expect(page).to have_content 'Signed in as Ali'
  end

  scenario 'User can log out' do
    visit '/signup'
    signup

    click_button 'Create my account'
    expect(page).to have_content 'Logout'

    click_link 'Logout', match: :first

   expect(page).to_not have_content 'Signed in as Ali'
  end
end
