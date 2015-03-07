L.Control.Text = L.Control.extend
  options: {
      position: 'bottomleft'
  }

  initialize: (content, options) ->
    @content = content
    @container = L.DomUtil.create('div', 'text-control')
    @container.innerHTML = @content

    L.Util.setOptions(this, options)

  onAdd: (map) ->
      @container
