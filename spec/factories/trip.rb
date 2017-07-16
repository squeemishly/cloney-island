FactoryGirl.define do
  factory :trip do
    start_date "9-28-2017"
    end_date "9-30-2017"
    user
    start_city "Denver"
  end
end