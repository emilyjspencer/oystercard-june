require 'station'

describe Station do

    let(:station) { Station.new('Waterloo', '1') }

    describe '#initialize' do
      it 'has a name' do
        expect(station.name).to eq 'Waterloo'
      end 

      it 'has a zone' do
        expect(station.zone).to eq '1'
      end 
    end 

        



end 