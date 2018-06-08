document.addEventListener('turbolinks:load', ->
  $activePet = $('.pet-0')
  $activeCard = $('.card-0')
  # adds active class to first pet and hides others
  $('.pet').each (index)->
    if index == 0
      $('.pet-'+ index).addClass('active')
    else if index > 0
      $('.card-' + index).hide()


  $('.pet').each (index)->
    $('.pet-'+ index).click(->
      $($activeCard).fadeOut(500, ->(
        $activeCard = $('.card-'+ index)
        $($activeCard).fadeIn(500)
      ))
      $activePet = $(this)
      $($activePet).addClass('active')
      $('.pet').not(this).removeClass('active')
    )
)
