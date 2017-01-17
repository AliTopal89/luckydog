require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  describe "GET #page_not_found" do
    it "returns http success" do
      get :page_not_found
      expect(response.status).to eq(404)
    end
  end

  describe "GET #internal_server_error" do
    it "returns http success" do
      get :internal_server_error
      expect(response.status).to eq(500)
      expect(response).to have_http_status(:internal_server_error)
    end
  end

end
