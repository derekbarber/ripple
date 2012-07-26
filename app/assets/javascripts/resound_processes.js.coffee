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

  $('#confirmPaymentTable').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap"

  $('#uploadAssessmentTable').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap"

jQuery ->
  $(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
    $(this).datepicker
      format: "yyyy-mm-dd"
      weekStart: 1
      autoclose: true
  $(document).on "change", "[data-behaviour~='datepicker']", (e) ->
    form = $(this).closest('form')
    form.submit()

jQuery ->
  $('#selectSteps').change ->
    step = $(this).val()
    $('#schedule_assessment').hide();
    $('#confirm_payment').hide();
    $('#upload_assessment').hide();
    if step == "all"
      $('#schedule_assessment').show()
      $('#confirm_payment').show()
      $('#upload_assessment').show()
    else if step == "schedule_assessment"
      $('#schedule_assessment').show()
    else if step == "confirm_payment"
      $('#confirm_payment').show()
    else if step == "upload_assessment"
      $('#upload_assessment').show()
