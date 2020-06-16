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
    end 

    
end 