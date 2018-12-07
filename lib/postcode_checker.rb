require 'httparty'

class Postcode_checker

  def output_lsoa(postcode)
    postcode_info = HTTParty.get("https://api.postcodes.io/postcodes/#{postcode}")
    postcode_info["result"]["lsoa"]
  end

end
