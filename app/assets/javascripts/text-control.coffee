L.Control.Text = L.Control.extend
  options: {
      position: 'bottomleft'
  }

  initialize: (content, options) ->
    this.content = content
    L.Util.setOptions(this, options)

  onAdd: (map) ->
      container = L.DomUtil.create('div', 'text-control')
      container.innerHTML = this.content
      container
