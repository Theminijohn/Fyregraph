FactoryGirl.define do
  factory :contact do

    # Associations
    association :user
    association :project

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    home_phone "1234567890"

  end
end
