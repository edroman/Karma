# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#needs_thanks .center").on "click", ".blue_button", (event) ->
    $(this).removeClass('blue_button').addClass('red_button').text("धैर")
  $("#needs_thanks .center").on "click", ".red_button", (event) ->
    $(this).removeClass('red_button').addClass('green_button').text("्耐心")
  $("#needs_thanks .center").on "click", ".green_button", (event) ->
    $(this).removeClass('green_button').addClass('grey_button').text("υπομονή")
  $("#needs_thanks .center").on "click", ".grey_button", (event) ->
    $(this).removeClass('grey_button').addClass('blue_button').text("Patience")