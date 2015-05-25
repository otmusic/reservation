class ReservationsController < ApplicationController

	before_action :set_restaurant
	before_action :set_table
	before_action :set_reservation, only: [:edit, :update, :destroy]

	def new
		@reservation = @table.build_reservation
	end

	def create
		@reservation = @table.create_reservation(permitted_params.reservation)
		if @reservation.save
			redirect_to restaurant_path(@restaurant), notice: I18n.t('reservation.create_message')
		else
			render :new
		end
	end

	def edit; end

	def update
		if @reservation.update_attributes(permitted_params.reservation)
			redirect_to restaurant_path(@restaurant), notice: I18n.t('reservation.update_message')
		else
			render :edit
		end
	end

	def destroy
		@reservation.delete
		redirect_to restaurant_path(@restaurant), notice: I18n.t('reservation.remove_message')
	end

	private

		def set_restaurant
			@restaurant = current_user.restaurants.find(params[:restaurant_id])
		end

		def set_table
			@table = Table.find(params[:table_id])
		end

		def set_reservation
			@reservation = @table.reservation
		end

end
