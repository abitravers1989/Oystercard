require './lib/Oystercard.rb'

card = Oystercard.new
card.balance
card.top_up(5)
card.top_up(95) #should output error message
card.deduct(95)


#challenge9

require './lib/Oystercard.rb'
card = Oystercard.new
card.touch_in #this gives true but you would want it to give false
