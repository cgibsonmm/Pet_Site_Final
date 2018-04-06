// TODO: need to add on click

document.onreadystatechange = function(){
  var button = document.querySelector('#drop-me')
  var dropdown = document.querySelector('.dropdown')

  button.onclick = function(){
    dropdown.setProperty('display', 'inline-block')
  }
}
