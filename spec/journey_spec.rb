require 'journey'

describe Journey do

  let(:journey) {described_class.new}

  describe('#initialize')
    it 'presumes user is initially not in a journey' do
      expect(journey.in_journey).to be(false)
    end

  describe('#touch_in')
    it {is_expected.to respond_to(:touch_in)}

    it 'changes status of trip on touch in' do
      journey.touch_in
      expect(journey.in_journey).to eq(true)
    end

  describe('#touch_out')
    it 'changes status of trip on touch in' do
      journey.touch_out
      expect(journey.in_journey).to eq(false)
    end

end
