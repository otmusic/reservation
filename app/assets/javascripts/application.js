//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.datetimepicker
//= require turbolinks
//= require_tree .

$(function () {
	$('#reservation_start_time').datetimepicker();
	$('#reservation_end_time').datetimepicker();
})