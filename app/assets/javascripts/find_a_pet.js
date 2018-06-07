// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
  // Zip code input
  var zipInput = document.getElementById('zipInput')
  var speciesType = document.getElementById('speciesType')

  // on click clears any previous search and requests
  $('#search_button').click(function() {
    $('#petsList').empty()
    var species = speciesType.value
    var urlWithZip = 'http://api.petfinder.com/pet.find?animal='+ species +'&location=' + zipInput.value + '&key=34cddab0b6464620f91ee1a0b406bfee&&output=full&format=json'

    if (zipInput.value.length < 5){
      alert('zip code must be present')
    }

    $.ajax({
      url: urlWithZip,
      type: 'GET',
      dataType: 'jsonp'
    })
    .done(function(data){
      var returnedPets = data.petfinder.pets.pet
      returnedPets.forEach(function(pet){
        var petName = Object.values(pet.name)
        var petImage =  (Object.values(pet.media.photos.photo[2])[1])

        $('#petsList').append(
          "<li class='pet'>" + petName + "</li>",
          '<img src='+ petImage + '>'
        )
      })
    })
    .error(function() {
      alert('Error grabing response from server')
    })
  })
});
