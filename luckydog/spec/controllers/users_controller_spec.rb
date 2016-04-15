require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status" do
			get :index
			expect(response). to be_success
			expect(response). to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "loads all of the users into @users" do
			user1, user2 = User.create!, User.create!
			get :index

			expect(assigns(:users)).to eq([user1, user2])
		end
	end

end
