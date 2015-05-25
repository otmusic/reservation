
FactoryGirl.define do
  factory :restaurant do
    user_id '1'
    sequence(:name) { |n| "Restaurant ##{ n }" }
  end
end