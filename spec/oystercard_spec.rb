require 'oystercard'

describe OysterCard do

    

    describe 'add' do
      it 'can have credit added to it' do
        oystercard = OysterCard.new
        oystercard.add(5)
        expect(oystercard.balance).to eq 5
      end
    end 
end 