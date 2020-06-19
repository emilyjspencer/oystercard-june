require 'oystercard'

describe OysterCard do

    let(:oystercard) { OysterCard.new(journey_class: journey_class) }
    let(:station1) { double :station1 }
    let(:station2) { double :station2 }
    let(:journey_made) { { entry: station1, exit: station2 }}
    let(:journey) { double :journey, start: nil, end: nil, stations_passed: journey_made, fare: 1 }
    let(:journey_class) { double :journey_class, new: journey }

    let(:incomplete_journey1) { { entry: nil, exit: station2 } } # doesn't tap in 
    let(:inc_journey1) { double :inc_journey, start: nil, end: nil, stations_passed: incomplete_journey1, fare: 6 }
    let(:inc_journey_class1) { double :inc_journey_class, new: inc_journey1 }

    let(:incomplete_journey2) { { entry: station1, exit: nil } } # doesn't tap out
    let(:inc_journey2) { double :inc_journey, start: nil, end: nil, stations_passed: incomplete_journey2, fare: 6 }
    let(:inc_journey_class2) { double :inc_journey_class, new: inc_journey2 }

    describe '#add' do
      it 'can have credit added to it' do
        oystercard.add(5)
        expect(oystercard.balance).to eq 5
      end

      it 'can have no more than 90 pounds of credit added to it' do
        maximum_balance = OysterCard::MAXIMUM_BALANCE
        oystercard.add(maximum_balance)
        expect { oystercard.add(10) }.to raise_error "Unable to add credit. Maximum balance of #{maximum_balance} exceeded"
      end 
    end 



    describe '#touch_in' do
      #it 'can touch in at an entry station' do
       # oystercard.add(20)
        #oystercard.touch_in(station1)
        #expect(oystercard.in_journey).to eq true
      #end

      it 'raises an error if the card balance is less than 1 pound' do
        expect { oystercard.touch_in(station1) }.to raise_error "Unable to touch in. Minimum of 1 pound credit required"
      end


      #it 'remembers the entry station' do
       # oystercard.add(20)
        #oystercard.touch_in(station1)
        #expect(oystercard.entry_station).to eq station1
      #end 

      it 'only touching in and not touching out is recorded as an incomplete journey' do
        oystercard = OysterCard.new(journey_class: inc_journey_class1)
        oystercard.add(20)
        oystercard.touch_in(station1)
        oystercard.touch_in(station1)
        expect(oystercard.journey_history[-1].stations_passed).to eq incomplete_journey1
      end 

      it 'only touching in triggers the penalty fare' do
        oystercard = OysterCard.new(journey_class: inc_journey_class1)
        oystercard.add(20)
        oystercard.touch_in(station1)
        expect { oystercard.touch_in(station1) }.to change { oystercard.balance }.by(-6)
      end 
    end 

    describe '#touch_out' do
    
  
      it 'deducts one pound from the credit upon touching out' do
        oystercard.add(20)
        oystercard.touch_in(station1)
        expect { oystercard.touch_out(station2) }.to change{ oystercard.balance }.by(-OysterCard::MINIMUM_BALANCE)
      end 

      it 'forgets the entry station when touching out' do
        oystercard.add(20)
        oystercard.touch_in(station1)
        oystercard.touch_out(station2)
        expect(oystercard.entry_station).to eq nil
      end 

      it 'touching out but not touching in is registered as an incomplete journey' do
        oystercard = OysterCard.new(journey_class: inc_journey_class2)
        oystercard.add(20)
        oystercard.touch_out(station2)
        expect(oystercard.journey_history[-1].stations_passed).to eq incomplete_journey2
      end 

      it 'touching out but not touching in triggers the penalty fare' do
        oystercard = OysterCard.new(journey_class: inc_journey_class2)
        oystercard.add(20)
        expect { oystercard.touch_out(station2) }.to change { oystercard.balance}.by(-6)
      end 

    end 

    describe '#journey_history' do
      it 'shows a list of the journeys made' do
        oystercard.add(20)
        oystercard.touch_in(station1)
        oystercard.touch_out(station2)
        expect(oystercard.journey_history[-1].stations_passed).to eq journey_made
      end
    end 

    
end 