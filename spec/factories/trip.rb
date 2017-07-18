FactoryGirl.define do
  factory :trip do
    start_date "2017-10-28"
    end_date "2017-10-30"
    user
    start_city "Denver"
    city
  end
end
