String.prototype.capitalize = () ->
  this[0].toUpperCase() + this.substring 1
