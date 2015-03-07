#= require 'leaflet/dist/leaflet-src.js'
#= require 'proj4/dist/proj4-src.js'
#= require 'Proj4Leaflet/src/proj4leaflet.js'
#= require 'leaflet-draw/dist/leaflet.draw-src.js'
#= require 'polarmap/dist/polarmap-src.js'
#= require 'autosize'
#= require 'text-control'

$(document).ready ->
  Autosize.enable()
  pMap = polarMap('xmap', permalink: false)

  navigation = new L.Control.Text("<a href='/map_notes' class='btn btn-default'>Back</a>")
  pMap.map.addControl(navigation)

  # Drawing Control
  drawnItems = new L.FeatureGroup()
  pMap.map.addLayer(drawnItems)

  drawControl = new L.Control.Draw(
    edit:
      featureGroup: drawnItems
  )
  pMap.map.addControl(drawControl)

  # Drawing Events
  pMap.map.on 'draw:created', (e) ->
    type = e.layerType
    layer = e.layer
    drawnItems.addLayer(layer)

