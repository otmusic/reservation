require 'rails_helper'

describe 'manage table' do

	before do
		login
	end

	context 'create table' do
		before do
			@restaurant = create(:restaurant, user: @user)
			@table = create(:table, restaurant: @restaurant)
			visit restaurant_path(@restaurant)
		end

		it 'show table information' do
			expect(page).to have_content 'reserv'
		end

		it 'edit table field' do
			click_link 'Edit'
			fill_in 'table_name', with: 'friends'
			fill_in 'table_number', with: '3'
			click_button 'Create'
			expect(page).to have_content 'friends'
			expect(page).to have_content '3'
    end

    it 'show flash update message' do
			click_link 'Edit'
			fill_in 'table_name', with: 'friends'
			fill_in 'table_number', with: '3'
			click_button 'Create'
			expect(page).to have_content 'Table successfuly updated'
		end

		it 'remove table' do
			expect(@restaurant.tables.count).to eq 1
      first(:link, 'Remove').click
      expect(@restaurant.tables.count).to eq 0
      expect(page).to have_content 'Table successfuly removed'
		end
	end

end