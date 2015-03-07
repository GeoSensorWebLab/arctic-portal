window.loadEditor = (map) ->
  # Drawing Control
  drawnItems = new L.FeatureGroup()
  map.addLayer(drawnItems)

  drawControl = new L.Control.Draw(
    edit:
      featureGroup: drawnItems
  )
  map.addControl(drawControl)

  # Drawing Events
  map.on 'draw:created', (e) ->
    type = e.layerType
    layer = e.layer
    drawnItems.addLayer(layer)

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

  # Form Validation
  validForm = ->
    valid = true
    errors = []

    if ($("#comments").val() is "")
      valid = false
      errors.push("Please add a description of the issue to the comment box.")

    if (drawnItems.toGeoJSON().features.length is 0)
      valid = false
      errors.push("Please add a map annotation (marker or shape) for the issue.")

    displayErrors(errors)
    valid

  displayErrors = (errors) ->
    for error in errors
      $("#formErrors").append($("<p></p>").text(error))
    true

  # Form Submission
  $("#formControl .submitMapNote").one "click", ->
    prepareForm()

  prepareForm = ->
    $("#formControl .submitMapNote")
    $("#formErrors").empty()

    if (validForm())
      sendFormData()
      .done((data, code, response) ->
        hideCommentForm()
        window.location.href = response.getResponseHeader("Location")
      )
      .fail((response, code, message) ->
        displayErrors(["I couldn't save your map note because of \"#{message}\"."])
      )
      .always(->
        $("#formControl .submitMapNote").one "click", ->
          prepareForm()
      )

  sendFormData = ->
    comment = $("#comments").val()
    features = drawnItems.toGeoJSON()
    $.ajax(
      type: "POST"
      url: "/map_notes"
      contentType: "application/json"
      data: JSON.stringify(
        map_note:
          comment: comment
          feature: JSON.stringify(features)
      )
      dataType: "json"
    )
