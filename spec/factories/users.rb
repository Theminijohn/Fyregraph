FactoryGirl.define do
  factory :user do

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "theminijohn#{n}@example.com" }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    password "123456789"
    password_confirmation "123456789"

  end
end
