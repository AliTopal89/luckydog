require 'rails_helper'
require 'spec_helper'

describe 'User system:' do

 	it 'should have no users registered initially.' do
 		expect(User.count).to eq(0)
  end

  it 'should not be logged on initially.' do
    expect(@current_user).to eq(nil)
  end

  let(:user) { create(:user) }

  it 'should have a single registered user.' do
  	expect(user.email).to eql('ali_t@gwmail.gwu.edu')
    expect(user.name).to eql('ali')
  end
   
end

