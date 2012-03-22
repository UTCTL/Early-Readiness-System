# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("label").click ->
    $checkbox = $(this).toggleClass("selected").find(":checkbox")
    if $(this).hasClass("selected")
      $checkbox.attr "checked", "checked"
    else
      $checkbox.removeAttr "checked"