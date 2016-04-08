FactoryGirl.define do

  factory :user do
    name "ali"
    email "ali_t@gwmail.gwu.edu"
    password_digest "secret"
    # password_digest "MyString"
  end
end
