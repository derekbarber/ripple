# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#scheduleAssessmentTable').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap",
    "aoColumns": [
          { "bSortable": false },
          null,
          null,
          { "bSortable": false },
          { "bSortable": false },
          null
    ],
    "aaSorting": [[5, "asc"]]

jQuery ->
  $('#confirmPaymentTable').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap"

jQuery ->
  $('#uploadAssessmentTable').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap"


$(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
  $(this).datepicker
    format: "yyyy-mm-dd"
    weekStart: 1
    autoclose: true

#jQuery ->
#  $('.best_in_place').best_in_place();
