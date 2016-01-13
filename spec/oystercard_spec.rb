require 'oystercard'

describe Oystercard do
  let(:oystercard) {described_class.new}

  describe('#initialize')
    it 'ensures default balance is set to 0' do
      expect(oystercard.balance).to eq(described_class::DEFAULT_BALANCE)
    end
    it 'presumes user is initially not in a journey' do
       expect(oystercard.in_journey).to be(false)
   end

  describe('#top_up')

    it 'updates balance of the card when topped-up' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq(10)
    end

    it 'raises an error if topped-up over the limit' do
      max = described_class::MAX_BALANCE
      oystercard.top_up(max)
      expect{oystercard.top_up(1)}.to raise_error('Maximum balance of 50 exceeded')
    end

  describe('#touch_in')

    it 'changes status of trip on touch in' do
      oystercard.top_up(10)
      oystercard.touch_in
      expect(oystercard.in_journey).to eq(true)
    end

    it 'raises an error if funds are insufficient' do
      expect{oystercard.touch_in}.to raise_error('Insufficient funds for journey')
    end

  describe('#touch_out')
    it 'changes status of trip on touch in' do
      oystercard.top_up(described_class::MIN_FARE)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey).to eq(false)
    end

    it 'deduces balance by minimum fare' do
      min = described_class::MIN_FARE
      oystercard.top_up(min)
      oystercard.touch_in
      expect{oystercard.touch_out}.to change{oystercard.balance}.by(-min)
    end
end
