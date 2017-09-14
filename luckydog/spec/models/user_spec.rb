require 'rails_helper'
require 'spec_helper'

describe 'User system:' do
	let(:user) { create(:user) }

 	it 'should have no users registered initially.' do
 		expect(User.count).to eq(0)
  end

  it 'should not be logged on initially.' do
    expect(@current_user).to eq(nil)
  end

  it 'should have a single registered user.' do
  	expect(user.email).to eql('ali_t@gwmail.gwu.edu')
    expect(user.name).to eql('ali')
  end
  it 'lets you create a password' do
  	user = build(:user, password: 'secret')
  	expect(user.password).to_not be_nil
  end
end

