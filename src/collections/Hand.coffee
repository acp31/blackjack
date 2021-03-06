class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @checkBust()
      @trigger 'bust', @
  ,

  stand: ->
    @trigger 'stand', @
  ,

  dealersPlay: ->
    @first().flip()
    while @scores()[0] < 15
      @hit()
    if !@checkBust()
      @stand()
  #flip dealers card.
  #if dealer is under 15, hit dealer until > 15.
  #compare score to dealer
    #alert win or lose
  ,

  #checkBust: if scores is > 21, alert loss
  checkBust: ->
    @scores()[0] > 21

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0
  maxScore: ->
    if @scores()[1] <= 21 then @scores()[1] else @scores()[0]
  ,

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


