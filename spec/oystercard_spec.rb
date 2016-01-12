require 'oystercard'

describe Oystercard do

  let(:oystercard) {described_class.new}

  describe('#initialize')
    it 'ensures default balance is set to 0' do
      expect(oystercard.balance).to eq(described_class::DEFAULT_BALANCE)
    end

  describe('#top_up')
    it {is_expected.to respond_to(:top_up)}

    it 'updates balance of the card when topped-up' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq(10)
    end

    it 'raises an error if topped-up over the limit' do
      oystercard.balance = described_class::MAX_BALANCE
      expect{oystercard.top_up(1)}.to raise_error('Maximum balance of 50 exceeded')
    end

end
