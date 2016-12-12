require 'rails_helper'

RSpec.describe "users/_password_strength", type: :view do
  include RSpecHtmlMatchers
	it 'renders the HTML template' do 
		render
	end

	it 'has tags' do
		expect('<div class="pw-bar"</div>').to have_tag('div')
	end
end
