FactoryGirl.define do

  factory :user do
  	id "300"
    name "ali"
    email "ali_t@gwmail.gwu.edu"
    password "secret"
    password_digest "secret"
    rememeber_me 'secret'
    created_at Time.now	
    updated_at Time.now
 	# confirmed_at Time.now
  end
end
