module ApplicationHelper

	def alert_class_for(type)
		{ alert: 'alert-danger', notice: 'alert-success' }[type.to_sym] || type.to_s
	end

end
