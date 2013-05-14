# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.trees a').pjax('[data-pjax-container]')

window.initMap = (map) ->
  #map = new L.map('map')
  osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
  osmAttrib='Map data © OpenStreetMap contributors'
  osm = new L.TileLayer(osmUrl, {minZoom: 8, maxZoom: 12, attribution: osmAttrib})
  map.setView(new L.LatLng(34.4429072, -119.8466323),9)
  map.addLayer(osm)

window.mapPlot = (map, latitude, longitude) ->
  marker = L.marker([latitude, longitude]).addTo(map)

