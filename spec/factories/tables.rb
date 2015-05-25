
FactoryGirl.define do
  factory :table do
    restaurant_id '1'
    sequence(:name) { |n| "Table ##{ n }" }
    sequence(:number) { |n| n }
  end
end