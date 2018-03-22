
$(document).on('turbolinks:load', ->
  $('.dropbtn').click ->
    $('#nav_dropdown').toggle('drop') ->
      $(this).removeClass('.active')
      $(this).addClass('.active')
)
