# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#jQuery ->
#  $("input.date_picker").datepicker();

#$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
#    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
#});

$(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
  $(this).datepicker
    format: "yyyy-mm-dd"
    weekStart: 1
    autoclose: true

jQuery ->
  $('.best_in_place').best_in_place();


