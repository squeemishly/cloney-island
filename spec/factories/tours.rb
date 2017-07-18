FactoryGirl.define do
  factory :tour do
    name "MyString"
    description "MyString"
    price "MyString"
    average_rating 1.5
    association :user
  end
end
