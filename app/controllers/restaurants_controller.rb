class RestaurantsController < ApplicationController

	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@restaurants = current_user.restaurants.all.page(params[:page]).per(Restaurant::PAGINATION)
	end

	def new
		@restaurant = current_user.restaurants.build
	end

	def create
		@restaurant = current_user.restaurants.new(permitted_params.restaurant)
		if @restaurant.save
			redirect_to restaurants_path, notice: I18n.t('restaurant.create_message')
		else
			render :new
		end
	end

	def show; end

	def edit; end

	def update
		if @restaurant.update_attributes(permitted_params.restaurant)
			redirect_to restaurant_path(@restaurant), notice: I18n.t('restaurant.update_message')
		else
			render :edit
		end
	end

	def destroy
		@restaurant.delete
		redirect_to restaurants_path, notice: I18n.t('restaurant.remove_message')
	end

	private

		def set_restaurant
			@restaurant = current_user.restaurants.find(params[:id])
		end
	
end
