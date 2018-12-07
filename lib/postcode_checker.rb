require 'httparty'

class Postcode_checker

  def output_lsoa(postcode)
    cleansed_pc = cleanse_postcode(postcode)
    postcode_info = HTTParty.get("https://api.postcodes.io/postcodes/#{cleansed_pc}")
    postcode_info["result"]["lsoa"]
  end

  private

  def cleanse_postcode(postcode)
    postcode.gsub(' ', '')
  end
end
