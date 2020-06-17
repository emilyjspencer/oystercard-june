require 'journey'



describe Journey do

  let(:journey) { Journey.new }
  let(:station1) { double :station1 }
  let(:station2) { double :station2 }
  let(:full_journey) { { entry: station1, exit: station2 } }

  describe '#start' do
    it 'changes the in_journey status from false to true' do
      journey.start(station1)
      expect(journey.in_journey).to eq true
    end

    it 'saves the entry station when starting a journey' do
      journey.start(station1)
      expect(journey.stations_passed[:entry]).to eq station1
    end 
  end

  describe '#end' do
    it 'changes the in_journey status from true to false' do
      journey.end(station2)
      expect(journey.in_journey).to eq false
    end

    it 'saves the exit station for full journey' do
      journey.start(station1)
      journey.end(station2)
      expect(journey.stations_passed).to eq full_journey
    end 

    it 'recognizes incomplete journeys without a touch in' do
      journey.end(station2)
      expect(journey.incomplete?).to eq true
    end

    it 'recognizes incomplete journeys without a touch out' do
      journey.start(station1)
      expect(journey.incomplete?).to eq true
    end 

    it 'costs one pound for a complete journey' do
      journey.start(station1)
      journey.end(station2)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end 

    it 'costs six pounds for a journey if the user misses either tap in or out' do
      journey.start(station1)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end 


  end 

      
end 