require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
	# before(:each) do
	# 	@user = {:email => "example@email.com", :password => "secret", :password_digest => "secret"}
	# end
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

		it 'has a valid factory' do
			FactoryGirl.create(:user) # or should be_valid.. 
		end

		let!(:user1) { FactoryGirl.create(:user, id: "1", name: 'user1', email: 'example@email.com', password: 'abc123', password_digest: 'abc123', created_at: Time.now, updated_at: Time.now, rememeber_me: 'secret')}
		let!(:user2) { FactoryGirl.create(:user, id: "2", name: 'user2', email: 'exmaple@email.com', password: 'abc123', password_digest: 'abc123', created_at: Time.now, updated_at: Time.now, rememeber_me: 'secret')}


		it "loads all of the users into @users" do

			# user1, user2 = User.create!, User.create!
			get :index

			# expect(assigns(:users)).to eq([user1, user2])
		end
	end

end
