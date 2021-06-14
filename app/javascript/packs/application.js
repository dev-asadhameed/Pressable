// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
import 'jquery-validation'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

$(document).on('turbolinks:load', function(){
  $('.flash-msg').fadeOut(5000);
  $("form").validate({
    rules: {
      email: {
        required: true,
        email: true
      }
    },
    messages: {
      email: "Please enter a valid email address"
    }
  });
});
