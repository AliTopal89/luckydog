require 'rails_helper'

RSpec.feature "Errors", type: :feature do
  scenario 'user gets a page not found' do
  	visit '/404'
  	expect(page.status_code).to eq 404
  end

  scenario 'user gets a custom internal server error page' do
  	visit '/500'
  	expect(page.status_code).to eq 500
  end
end
