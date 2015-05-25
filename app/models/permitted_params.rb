class PermittedParams

	attr_reader :params

	def initialize(params)
		@params = params
	end

	def restaurant
		params.require(:restaurant).permit(:name, :avatar)
	end

	def reservation
		params.require(:reservation).permit(:start_time, :end_time)
	end

	def table
		params.require(:table).permit(:name, :number)
	end

end