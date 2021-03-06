require 'httparty'

class Postcode_checker

  def initialize(postcode_api = 'https://api.postcodes.io/postcodes/')
    @whitelist_lsoas = ['Lambeth', 'Southwark']
    @whitelisted_unknown_postcodes = ['SH241AA', 'SH241AB']
    @postcode_api = postcode_api
  end

  def output_lsoa(postcode)
    cleansed_pc = cleanse_postcode(postcode)
    postcode_info = HTTParty.get("#{@postcode_api}#{cleansed_pc}")
    postcode_info['result']['lsoa'] if postcode_info['status'] == 200
  end

  def serviceable?(postcode)
    lsoa = output_lsoa(postcode)
    if lsoa
      lsoa_text = lsoa.split(' ').first
      @whitelist_lsoas.include?(lsoa_text)
    else
      @whitelisted_unknown_postcodes.include?(cleanse_postcode(postcode))
    end
  end

  private

  def cleanse_postcode(postcode)
    postcode.delete(' ')
  end
end
