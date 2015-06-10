#= require 'leaflet/dist/leaflet-src.js'
#= require 'proj4/dist/proj4-src.js'
#= require 'Proj4Leaflet/src/proj4leaflet.js'
#= require 'leaflet-draw/dist/leaflet.draw-src.js'
#= require 'polarmap/dist/polarmap-src.js'
#= require 'autosize'
#= require 'text-control'
#= require 'editor'
#= require 'viewer'

$(document).ready ->
  Autosize.enable()
  pMap = polarMap('xmap', permalink: false)

  # Nav Control
  navigation = new L.Control.Text("<a href='/map_notes' class='btn btn-default'>Back</a>")
  pMap.map.addControl(navigation)

  re = /new$/
  if (re.test(window.location.href))
    # Editing
    loadEditor(pMap.map)
  else
    loadViewer(pMap.map)
