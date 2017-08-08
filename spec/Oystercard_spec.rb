require './lib/oystercard.rb'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up balance' do
    expect { subject.top_up(5) }.to change { subject.balance }.to 5
  end

  it 'balance has a limit of £90' do
    subject.top_up(90)
    expect { subject.top_up(1) }.to raise_error ("Card has reached limit, cannot be topped up")
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'will deduct money from balance' do
   subject.top_up(10)
   expect(subject.deduct(5)).to eq 5
 end

  it { is_expected.to respond_to(:in_journey?) }

  it { is_expected.to respond_to(:touch_in) }

  it { is_expected.to respond_to(:touch_out) }

  it 'touching in will mean a user is in journey' do
    expect { subject.touch_in }.to change { subject.in_journey? }.to true
  end

  it 'touching out will mean a user isnt in a journey' do
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey? }.to false
  end

  it 'touch in is not allowed when user already in' do
    subject.touch_in
    expect { subject.touch_in }.to raise_error ("Card in use")
  end

  end



def touch_in




end
#What are exceptions in Ruby? Why do they have messages associated with them?
#How can you check an expression raises an error with RSpec? Why do you have to pass the code as a block to do this?
