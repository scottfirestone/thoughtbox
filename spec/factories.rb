FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    read false
  end
  factory :user do
    email "MyString"
    password_digest "MyString"
    password_confirmation "MyString"
  end
end