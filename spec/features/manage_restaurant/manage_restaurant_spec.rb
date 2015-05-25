require 'rails_helper'

describe 'manage restaurant' do

	before do
		login
	end

	context 'create restaurant' do
		before do
			@restaurant = create(:restaurant, user: @user)
		end

		it 'show create table button' do
			visit restaurant_path(@restaurant)
      expect(page).to have_content 'Tables reservation'
		end

		it 'edit restaurant field' do
			visit root_path
			click_link 'edit'
			fill_in 'restaurant_name', with: 'Oskar'
			click_button 'Create'
			expect(page).to have_content 'Oskar'
    end

    it 'show flash update message' do
    	visit root_path
			click_link 'edit'
			fill_in 'restaurant_name', with: 'Oskar'
			click_button 'Create'
			expect(page).to have_content 'Restaurant successfuly updated'
		end

		it 'remove restaurant' do
			visit root_path
			expect(@user.restaurants.size).to eq 1
      first(:link, 'Destroy').click
      expect(@user.restaurants.size).to eq 0
      expect(page).to have_content 'Restaurant successfuly removed'
		end
	end

end