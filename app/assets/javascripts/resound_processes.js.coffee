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

  $('#scheduleLessonsTable').dataTable
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap"

  $('#welcomeEmailTable').dataTable
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
  $(document).on "focus", "[data-behaviour~='datepicker2']", (e) ->
    $(this).datepicker
      format: "yyyy-mm-dd"
      weekStart: 1
      autoclose: true

jQuery ->
  $('#selectSteps').change ->
    step = $(this).val()
    $('#schedule_assessment').hide();
    $('#confirm_payment').hide();
    $('#upload_assessment').hide();
    $('#schedule_lessons').hide()
    $('#welcome_email').hide()
    $('#email_assessment').hide()
    $('#next_day_followup').hide()
    $('#one_month_followup').hide()
    $('#four_month_followup').hide()
    if step == "all"
      $('#schedule_assessment').show()
      $('#confirm_payment').show()
      $('#upload_assessment').show()
      $('#schedule_lessons').show()
      $('#welcome_email').show()
      $('#email_assessment').show()
      $('#next_day_followup').show()
      $('#one_month_followup').show()
      $('#four_month_followup').show()
    else if step == "schedule_assessment"
      $('#schedule_assessment').show()
    else if step == "confirm_payment"
      $('#confirm_payment').show()
    else if step == "upload_assessment"
      $('#upload_assessment').show()
    else if step == "schedule_lessons"
      $('#schedule_lessons').show()
    else if step == "welcome_email"
      $('#welcome_email').show()
    else if step == "email_assessment"
      $('#email_assessment').show()
    else if step == "next_day_followup"
      $('#next_day_followup').show()
    else if step == "one_month_followup"
      $('#one_month_followup').show()
    else if step == "four_month_followup"
      $('#four_month_followup').show()


jQuery ->
  $('.checkable').change ->
    if confirm('Are you sure?')
      $(this).parents('form:first').submit()
    else
      $(this).attr('checked', false)


