#= require 'leaflet/dist/leaflet-src.js'
#= require 'proj4/dist/proj4-src.js'
#= require 'Proj4Leaflet/src/proj4leaflet.js'
#= require 'polarmap/dist/polarmap-src.js'
#= require 'autosize'

$(document).ready ->
  Autosize.enable()
  map = polarMap('xmap', permalink: false)
