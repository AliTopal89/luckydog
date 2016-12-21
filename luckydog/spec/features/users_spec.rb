require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'User creates a new account' do 
  	visit '/signup' 

  	fill_in 'Name', :with =>'Ali'
  	fill_in 'Email', :with => 'example@mail.com'
  	fill_in 'Password', :with => 'Password!'
  	fill_in 'Confirmation', :with => 'Password!'

  	click_button 'Create my account'

  	expect(page).to have_content 'Signed in as Ali'
  end
end
