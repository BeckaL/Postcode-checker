require './lib/postcode_checker'

describe 'Postcode_checker' do
  let(:parliament_postcode) { "SW1A0AA" }
  let(:westminster_lsoa) { "Westminster 020C" }
  let(:parliament_with_spaces) { " SW1A 0AA  " }

  before do
    @checker = Postcode_checker.new
  end

  describe '#output_lsoa' do
    it 'fetches the LSOA for a postcode' do
      expect(@checker.output_lsoa(parliament_postcode)).to eq westminster_lsoa
    end

    it 'fetches the LSOA for a postcode with extra spaces in' do
      expect(@checker.output_lsoa(parliament_with_spaces)).to eq westminster_lsoa
    end
  end

end
