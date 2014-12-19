# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body "MyText"
    messagable_id 1
    messagable_type "MyString"
  end
end
