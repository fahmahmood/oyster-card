require 'journeylog'

describe JourneyLog do

subject(:log) {described_class.new(journey)}
let(:journey) {double(:journey, start:true, finish:true, fare:5)}
let(:station) {double(:station)}


	describe '#start' do

		
		it 'completes a journey and stores it into an array' do
		log.start(station)
		log.finish(station)
		expect(log.log).to include journey
		end

		it 'receives the fare from journey' do
		expect(log.fare).to eq 5
		end  

	end

end 
