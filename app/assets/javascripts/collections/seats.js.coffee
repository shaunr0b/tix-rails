class Tix.Collections.Seats extends Backbone.Collection
  model: Tix.Models.Seat  
  
  initialize: ->
    @_total = 0.00
    this.bind 'add', this.addToTotal, this
    this.bind 'remove', this.removeFromTotal, this
    
      
  addToTotal: ->
    @_total += parseFloat this.last().get('price')
  
  removeFromTotal: ->
    if (this.last() )
      @_total -= parseFloat 
    else
      @_total = 0.00
    
    
  comparator: ->
    #date = new Date(this.model.get('date'))
    #return date.getTime()
    
  total: ->
    return (@formatCurrency(@_total))
    
  addSeatToCart: (args)-> #args refers to a seat circle raphaël obj
    
      
  formatCurrency: (num)->
    num = (if isNaN(num) or num is "" or num is null then 0.00 else num)
    num = parseFloat(num).toFixed 2
    return num