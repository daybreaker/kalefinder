# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

map = {} # make global

createHeatMap = (points) ->
  heatmap = new google.maps.visualization.HeatmapLayer({
    data: points,
    radius: 12
  })
  heatmap.setMap(map)

initialize = ->
  mapOptions =
    center: new google.maps.LatLng(29.951678, -90.098170),
    zoom: 13

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  createHeatMap(heatMapPoints)

google.maps.event.addDomListener(window, 'load', initialize)
