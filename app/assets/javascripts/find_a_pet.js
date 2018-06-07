// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


document.addEventListener('turbolinks:load', function(){
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
        var petInfo = Object.values(pet.description)
        var strInfo = JSON.stringify(petInfo).substr(0,100)
        var petBreed = Object.values(pet.breeds.breed)

        //Need to ask stack overflow about this.
        // function parseBreeds(breeds, name){
        //   var div = '.' + name + '_breeds'
        //   if (breeds.length > 1){
        //     for(i = 0; i < breeds.length; i++){
        //       console.log(breeds[i])
        //     }
        //   }
        //   else{
        //     return $(div).append(Object.values(breeds[0]))
        //   }
        // }

// TODO: Need to finish hiding and showing popover
        $('#petsList').append(
          '<li class="pet_card" style="background-image: url('+ petImage +')">'+
          '<li class="popover is-hidden">hello</li'
        )
      })
    })
    .error(function() {
      alert('Error grabing response from server')
    })
  })
});
