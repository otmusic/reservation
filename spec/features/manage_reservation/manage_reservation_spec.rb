require 'rails_helper'

describe 'manage reservation' do

	before do
		login
	end

	context 'restaurant reservation' do
		before do
			@restaurant = create(:restaurant, user: @user)
			@table = create(:table, restaurant: @restaurant)
			@reservation = create(:reservation, table: @table)			
			visit restaurant_path(@restaurant)
		end

		it 'show edit reservation button' do
      expect(page).to have_content 'edit reservation'
		end

		it 'edit reservation table' do
			click_link 'edit reservation'
		  fill_in 'reservation_start_time', with: '2015-05-06 12:34'
      fill_in 'reservation_end_time', with: '2015-05-06 15:34'
      click_button 'Create'
      expect(page).to have_content 'Table reserveation successfuly updated'
    end
	end

end