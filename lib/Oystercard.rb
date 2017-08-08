class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
    @user = false
  end

  Max_Balance = 90
  Default_value = 10

 def touch_in
   raise 'Card in use' if @user == true
   raise 'Insufficent funds avaliable' if @balance < 1
   @user = true
 end

 def in_journey?
    if @user == true
      true
    else
      false
    end
 end

 def touch_out
   @user = false
   deduct(5)
 end

private
 def deduct(number)
   @balance-=number
 end

public
  def top_up(n)
    fail 'Card has reached limit, cannot be topped up' if @balance+n > Max_Balance
    @balance += n
  end

  def deduct(n)
    @balance-=n
  end
end

=begin
Use interpolation
Use an inline if statement
Use a constant
Access a constant from outside the class
=end
