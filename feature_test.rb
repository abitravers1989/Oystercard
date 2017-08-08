require './lib/Oystercard.rb'

card = Oystercard.new
card.balance
card.top_up(5)
card.top_up(95) #should output error message
card.deduct(95)
