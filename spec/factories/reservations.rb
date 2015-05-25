FactoryGirl.define do
	factory :reservation do
		table_id '1'
		sequence(:start_time) { |n| Time.now + n.weeks }
 		sequence(:end_time) { |n| Time.now + n.weeks + 1.hour }
	end
end