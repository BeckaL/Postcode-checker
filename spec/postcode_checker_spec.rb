require './lib/postcode_checker'

describe 'Postcode_checker' do

  describe '#output_lsoa' do
    it 'fetches the LSOA for a postcode' do
      parliament_postcode = "SW1A0AA"
      westminster_lsoa = "Westminster 020C"
      checker = Postcode_checker.new
      expect(checker.output_lsoa(parliament_postcode)).to eq westminster_lsoa
    end
  end
end
