require 'journey'



describe Journey do

  let(:journey) { Journey.new }

  describe '#start' do
    it 'changes the in_journey status from false to true' do
      journey.start
      expect(journey.in_journey).to eq true
    end
  end

  describe '#end' do
    it 'changes the in_journey status from true to false' do
      journey.end
      expect(journey.in_journey).to eq false
    end
  end 

      
end 