class TablesController < ApplicationController

	before_action :set_table, only: [:edit, :update, :destroy]
	before_action :set_restaurant, only: [:new, :create, :edit, :update, :destroy]

	def new
		@table = @restaurant.tables.build
	end

	def create
		@table = @restaurant.tables.new(permitted_params.table)
		if @table.save
			redirect_to restaurant_path(@restaurant), notice: I18n.t('table.create_message')
		else
			render :new
		end
	end

	def edit; end

	def update
		if @table.update_attributes(permitted_params.table)
			redirect_to restaurant_path(@restaurant), notice: I18n.t('table.update_message')
		else
			render :edit
		end
	end

	def destroy
		@table.delete
		redirect_to restaurant_path(@restaurant), notice: I18n.t('table.remove_message')
	end

	private

		def set_restaurant
			@restaurant = Restaurant.find(params[:restaurant_id])
		end

		def set_table
			@table = Table.find(params[:id]).decorate
		end

end
