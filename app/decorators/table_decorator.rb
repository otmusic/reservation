class TableDecorator < Draper::Decorator
	include Rails.application.routes.url_helpers
  delegate_all

  def reservation_btn
  	if model.reservation?
  		h.link_to I18n.t('reservation.edit'), 
  			edit_restaurant_table_reservation_path(model.restaurant.id, model.id, model.reservation), class: 'btn btn-info'
  	else
  		h.link_to I18n.t('reservation.reserv_button'), 
  			new_restaurant_table_reservation_path(model.restaurant.id, model.id), class: 'btn btn-warning'
  	end
  end

	def date_reservation
		if model.reservation?
			model.reservation.start_time.strftime('%d/%m/%Y - %k:%M') + model.reservation.end_time.strftime(' - %d/%m/%Y - %k:%M')
		else
			I18n.t('reservation.not_reserved_date')
		end
	end

	def reservation_status
		if model.reservation?
			h.content_tag(:span, I18n.t('reservation.reserved'), class: 'label label-success')
		else
			h.content_tag(:span, I18n.t('reservation.not_reserved'), class: 'label label-default')
		end
	end

end
