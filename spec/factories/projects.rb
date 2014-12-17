FactoryGirl.define do
  factory :project do

    # Association
    association: user

    name { Faker::Company.name }
  end
end
