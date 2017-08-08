class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  Max_Balance = 90

  def top_up(n)
    fail 'Card has reached limit, cannot be topped up' if @balance+n > Max_Balance
    @balance += n
  end
end

=begin
Use interpolation
Use an inline if statement
Use a constant
Access a constant from outside the class
=end
