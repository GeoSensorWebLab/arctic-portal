window.loadViewer = (map) ->
  # Form Control
  displayCommentForm = ->
    $("#formControl").removeClass("hide")

  hideCommentForm = ->
    $("#formControl").addClass("hide")

  $("#formControl .hideComments").on "click", hideCommentForm

  formButton = new L.Control.Text("<button class='btn btn-default'>Comment</button>")
  $(formButton.container).on 'click', (e) ->
    displayCommentForm()
  map.addControl(formButton)

  L.geoJson(window.features).addTo(map)
