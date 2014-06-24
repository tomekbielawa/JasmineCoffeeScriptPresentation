test = {}

beforeEach ->
  test.basket = new Basket()
  test.item = new Item 1001, "Macbook Air", "Superb computer", 799
  item2 = new Item 1002, "Magic TrackPad", "Better than a mouse", 50
  test.basket.add item2, 1

describe "MyBasket Class", ->
  describe "MyBasket", ->
    it "should be able to add item to a basket", ->
      # given
        priorCountVal = test.basket.distinctCount
      # when
        test.basket.add test.item, 1
      # then
        expect(test.basket.distinctCount).toEqual priorCountVal + 1

    it "should be able to update quantity when adding an item already in the basket", ->
      # given
        priorCountVal = test.basket.getQuantity(1001)
      # when
        test.basket.add test.item, 1
      # then
        expect(test.basket.getQuantity(1001)).toEqual priorCountVal + 1

  describe "getSpecificQuantityForItem", ->
    it "should be falsy for unknown item", ->
      # when
      spQ4Item = test.basket.getSpecificQuantityForItem 12345
      # then
      expect(spQ4Item).toBeFalsy()

    it "should return false if we pass string instead of an item", ->
      # when
      spQ4Item = test.basket.getSpecificQuantityForItem "sfkjshdfkjhsd"
      # then
      expect(spQ4Item).toBeFalsy()