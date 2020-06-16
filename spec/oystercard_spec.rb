require 'oystercard'

describe OysterCard do

    let(:oystercard) { OysterCard.new }


    describe 'add' do
      it 'can have credit added to it' do
        oystercard.add(5)
        expect(oystercard.balance).to eq 5
      end

      it 'can have no more than 90 pounds of credit added to it' do
        oystercard.add(90)
        expect { oystercard.add(10) }.to raise_error "Unable to add credit. Maximum balance is 90"
      end 
    end 

    
end 