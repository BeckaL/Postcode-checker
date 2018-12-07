require 'httparty'

class Postcode_checker

  def initialize
    @whitelist_lsoas = ['Lambeth', 'Southwark']
  end

  def output_lsoa(postcode)
    cleansed_pc = cleanse_postcode(postcode)
    postcode_info = HTTParty.get("https://api.postcodes.io/postcodes/#{cleansed_pc}")
    postcode_info["result"]["lsoa"]
  end

  def whitelist?(postcode)
    lsoa = output_lsoa(postcode)
    lsoa_text = lsoa.split(' ').first
    @whitelist_lsoas.include?(lsoa_text)
  end
  
  private

  def cleanse_postcode(postcode)
    postcode.gsub(' ', '')
  end
end
