require 'oystercard'

describe Oystercard do

  let(:oystercard) {described_class.new}

  describe('#initialize')
    it 'ensures default balance is set to 0' do
      expect(oystercard.balance).to eq(described_class::DEFAULT_BALANCE)
    end

  describe('#top_up')
    it {is_expected.to respond_to(:top_up).with(1).argument}

    it 'updates balance of the card when topped-up' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq(10)
    end

    it 'raises an error if topped-up over the limit' do
      oystercard.balance = described_class::MAX_BALANCE
      expect{oystercard.top_up(1)}.to raise_error('Maximum balance of 50 exceeded')
    end

  describe('#deduct_fare')
    it {is_expected.to respond_to(:deduct_fare).with(1).argument}

    it 'updates balance of the card when fare is deducted' do
      oystercard.top_up(10)
      expect{oystercard.deduct_fare(2)}.to change{oystercard.balance}.by(-2)
    end

end
