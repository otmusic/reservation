class Reservation < ActiveRecord::Base

	belongs_to :table, dependent: :destroy

	validates_presence_of :start_time, :end_time

end
