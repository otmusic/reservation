class Table < ActiveRecord::Base

	belongs_to :restaurant, dependent: :destroy
	has_one :reservation, dependent: :destroy

	validates_presence_of :name, :number

	def reservation?
		self.reservation.present?
	end

end
