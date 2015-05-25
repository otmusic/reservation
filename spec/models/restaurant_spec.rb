require 'rails_helper'

describe Restaurant do

	let(:user) { create(:user) }
	let(:restaurant) { create(:restaurant, user: user) }

	describe 'validations' do
		subject { restaurant }
		it { should be_valid }
		it { should belong_to(:user) }
		it { should have_many(:tables) }
		it { should validate_presence_of :name }
		it { should validate_presence_of :user_id }
	end

end