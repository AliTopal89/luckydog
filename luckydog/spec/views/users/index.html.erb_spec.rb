require 'rails_helper'

RSpec.describe "users/index" do
	include RSpecHtmlMatchers
	it 'renders the HTML template' do 
		render

		expect(view).to render_template(:index)
		expect(view).to_not render_template(:new)
	end

	it 'has tags' do
		expect('<div class="container"</div>').to have_tag('div') 
		expect('<p>Uber for dogs</p>').to have_tag('p')
	end
end
