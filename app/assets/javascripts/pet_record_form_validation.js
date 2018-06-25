document.addEventListener('turbolinks:load', function() {
  let submit = document.querySelector('#record-submit-button')
  let nameInput = document.querySelector('#shot-name')
  var name = nameInput.forms;
  submit.disabled = true;

  if (name == ''){
    alert('fill in name')
  } else {
    submit.disabled = false;
  }
})
