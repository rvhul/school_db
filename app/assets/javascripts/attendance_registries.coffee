@AttendentUtils =
  init: ->
    $('.student-item').click ->
      StudentsDBUtils.toggle($(@).find('.fa'))
