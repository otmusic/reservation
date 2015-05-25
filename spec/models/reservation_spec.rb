require 'rails_helper'

describe Reservation do

	let(:table) { create(:table) }
	let(:reservation) { create(:reservation, table: table) }

	describe 'validations' do
		subject { reservation }
		it { should be_valid }
		it { should belong_to(:table) }
		it { should validate_presence_of :start_time }
		it { should validate_presence_of :end_time }
	end

end