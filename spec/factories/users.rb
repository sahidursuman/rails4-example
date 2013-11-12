# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "jane"
    email "jane@zoeoberon.com"
    password "123123"
    confirmed_at Time.now
  end
end
