require 'rails_helper'

RSpec.describe "users/new" do
	include RSpecHtmlMatchers
	it 'renders the HTML template' do 
		render

		expect(view).to render_template(:new)
		expect(view).to_not render_template(:index)
	end
	it 'has tags' do
		expect('<div class="container"</div>').to have_tag('div') 
	end
end
