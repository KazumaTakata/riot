
<loop-child>

  <looped-child each={ item in items } el={item}></looped-child>

  this.items = [ {name: 'one'}, {name: 'two'} ]
  this.childrenMountWidths = []

  getWidth(el) {
    if (el.root.getBoundingClientRect) {
      return el.root.getBoundingClientRect().width
    } else {
      return false
    }
  }

  this.on('mount', function() {
    this.tags['looped-child'].forEach(function(child) {
      this.childrenMountWidths.push(this.getWidth(child))
    }.bind(this))
  })

</loop-child>


<looped-child style="color: { color };">

  <h3>{ opts.el.name }</h3>
  <button onclick={ hit }>{ opts.el.name }</button>

  this.color = 'red'

  this.on('mount', function() {
    this.mountWidth = this.parent.getWidth(this)
  })

  hit(e) {
    this.color = 'blue'
  }

</looped-child>
