assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit().last()
      assert.strictEqual deck.length, 49
    it 'should alert a loss when player score is over 21', ->
      assert.

#   when player score is over 21, alert loss
#   when dealer score is over 21, alert win
#   on hit, hand.length should increment

#describe stand
#  flip dealers card on stand
#  if dealer score is higher than players, alert loss
#  if dealer is under 17, hit