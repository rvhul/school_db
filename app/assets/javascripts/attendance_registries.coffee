@AttendentUtils =
  init: ->
    $('.student-item').click (ev) ->
      ev.preventDefault()
      StudentsDBUtils.toggle($(@).find('.fa'))
      $(@).toggleClass('absent')
      false
  submit: ->
    absentees_ids = []
    $.each($('.student-item.absent'), (index, ele) ->
      absentees_ids.push(ele.dataset.studentId))
    $('#attendance_registry_absentee_ids').val(absentees_ids.join(','))
    $('#attendance_registry_form input.submit').click()
    console.log("clicked")

$ ->
  $('a#submit-attendance').click (ev) ->
    ev.preventDefault()
    AttendentUtils.submit()
    false
