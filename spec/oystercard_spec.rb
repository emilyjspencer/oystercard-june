require 'oystercard'

describe OysterCard do

    let(:oystercard) { OysterCard.new }


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

    describe '#deduct' do
      it 'can have credit deducted from it' do
        oystercard.add(20)
        expect(oystercard.deduct(10)).to eq 10
      end 

      it 'has one pound deducted from it for each journey' do
        oystercard.add(20)
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard.balance).to eq 19
      end 
    end 

    describe '#touch_in' do
      it 'can touch in at an entry station' do
        oystercard.add(20)
        oystercard.touch_in
        expect(oystercard.in_journey).to eq true
      end

      it 'raises an error if the card balance is less than 1 pound' do
        expect { oystercard.touch_in }.to raise_error "Unable to touch in. Minimum of 1 pound credit required"
      end 
    end 

    describe '#touch_out' do
      it 'can touch out at an exit station' do
        oystercard.add(20)
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard.in_journey).to eq false
      end
    end 
    
end 