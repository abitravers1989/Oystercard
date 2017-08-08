require './lib/oystercard.rb'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up balance' do
    default = Oystercard::Default_value
    expect { subject.top_up(default) }.to change { subject.balance }.to 10
  end

  it 'balance has a limit of £90' do
    subject.top_up(90)
    expect { subject.top_up(1) }.to raise_error ("Card has reached limit, cannot be topped up")
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'will deduct money from balance' do
   default = Oystercard::Default_value
   subject.top_up(default)
   expect(subject.deduct(default)).to eq 0
 end

  it { is_expected.to respond_to(:in_journey?) }

  it { is_expected.to respond_to(:touch_in) }

  it { is_expected.to respond_to(:touch_out) }

  it 'touching in will mean a user is in journey' do
    default = Oystercard::Default_value
    subject.top_up(default)
    expect { subject.touch_in }.to change { subject.in_journey? }.to true
  end

  it 'touching out will mean a user isnt in a journey' do
    default = Oystercard::Default_value
    subject.top_up(default)
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey? }.to false
  end

  it 'touch in is not allowed when user already in' do
    default = Oystercard::Default_value
    subject.top_up(default)
    subject.touch_in
    expect { subject.touch_in }.to raise_error ("Card in use")
  end

  it 'touch in is not allowed if there is an insufficent balance' do
    expect { subject.touch_in }.to raise_error ("Insufficent funds avaliable")
  end

  end
