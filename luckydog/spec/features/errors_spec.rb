require 'rails_helper'

RSpec.feature "Errors", type: :feature do
  scenario 'user gets a page not found' do
  	visit '/404'
  	expect(page.status_code).to eq 404
  	expect(page).to have_content('Errors#page_not_found')
  end

  scenario 'user gets a custom internal server error page' do
  	visit '/500'
  	expect(page.status_code).to eq 500
  	expect(page).to have_content('Errors#internal_server_error')
  end
end
