# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


window.initMap = (map, latitude, longitude) ->
  #map = new L.map('map')
  osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
  osmAttrib='Map data © OpenStreetMap contributors'
  osm = new L.TileLayer(osmUrl, {minZoom: 8, maxZoom: 12, attribution: osmAttrib})
  map.setView(new L.LatLng(latitude, longitude),9)
  map.addLayer(osm)

window.mapPlot = (map, latitude, longitude) ->
  marker = L.marker([latitude, longitude]).addTo(map)