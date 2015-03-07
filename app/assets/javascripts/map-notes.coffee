#= require 'leaflet/dist/leaflet-src.js'
#= require 'proj4/dist/proj4-src.js'
#= require 'Proj4Leaflet/src/proj4leaflet.js'
#= require 'polarmap/dist/polarmap-src.js'
#= require 'autosize'
#= require 'text-control'

$(document).ready ->
  Autosize.enable()
  pMap = polarMap('xmap', permalink: false)

  window.navigation = new L.Control.Text("<a href='/map_notes' class='btn btn-default'>Back</a>")
  pMap.map.addControl(navigation)
