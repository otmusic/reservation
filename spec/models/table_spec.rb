require 'rails_helper'

describe Table do

	let(:user) { create(:user) }
	let(:restaurant) { create(:restaurant, user: user) }
	let(:table) { create(:table, restaurant: restaurant) }

	describe 'validations' do
		subject { table }
		it { should be_valid }
		it { should have_one(:reservation) }
		it { should belong_to(:restaurant) }
		it { should validate_presence_of :name }
		it { should validate_presence_of :number }
	end

end