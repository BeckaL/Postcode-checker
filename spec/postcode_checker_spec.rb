require './lib/postcode_checker'

describe 'Postcode_checker' do
  let(:parliament) { {postcode: "SW1A0AA", lsoa:"Westminster 020C"} }
  let(:lambeth_palace) { {postcode: "SE17JU", lsoa: "Lambeth 036A"} }
  let(:palace_with_spaces) { " SE1 7 JU  " }
  let(:unknown_serviceable) { "SH24 1AA" }
  let(:southwark_cathedral) { {postcode: "SE19DA", lsoa: "Southwark 002B"} }


  before do
    @checker = Postcode_checker.new
  end

  describe '#output_lsoa' do
    it 'fetches the LSOA for a postcode' do
      expect(@checker.output_lsoa(lambeth_palace[:postcode])).to eq lambeth_palace[:lsoa]
    end

    it 'fetches the LSOA for a postcode with extra spaces in' do
      expect(@checker.output_lsoa(palace_with_spaces)).to eq lambeth_palace[:lsoa]
    end
  end

  describe '#whitelist' do
    it "returns true if a postcode is in Lambeth" do
      expect(@checker.whitelist?(lambeth_palace[:postcode])).to eq true
    end

    it 'returns true if a postcode is in Southwark' do
      expect(@checker.whitelist?(southwark_cathedral[:postcode])).to eq true
    end

    it 'returns true if a postcode is in the list of unknown but serviceable postcodes' do
      expect(@checker.whitelist?(unknown_serviceable)).to eq true
    end

    it 'whitelist returns false if a postcode is not in Lambeth or Southwark' do
      expect(@checker.whitelist?(parliament[:postcode])).to eq false
    end
  end
end
