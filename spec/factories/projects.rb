FactoryGirl.define do
  factory :project do

    # Association
    association :user

    name { Faker::Company.name }

    factory :invalid_project do
      name nil
    end
  end
end
