# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

initialize = ->
  mapOptions =
    center: new google.maps.LatLng(29.9667, -90.0500),
    zoom: 12
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

google.maps.event.addDomListener(window, 'load', initialize)
