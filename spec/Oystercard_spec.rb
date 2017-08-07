require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

describe '#top_up' do
  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up balance' do
    expect { subject.top_up(5) }.to change { subject.balance }.to 5
  end
end
end
