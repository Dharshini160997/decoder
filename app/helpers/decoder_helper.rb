module DecoderHelper
  def self.decoding(cin)
    listing_status = cin[0]
    industry_code = cin[1..2]
    state_code = cin[6..7]
    incorporation_year = cin[8..11]
    ownership = cin[12..14]
    registration = cin[15..20]
    
      @listing_status = LISTING_STATUS[listing_status],
      @industry_type = INDUSTRY_CODES[industry_code],
      @state = STATE_CODES[state_code],
      @incorporation_year = incorporation_year,
      @ownership = OWNERSHIP[ownership],
      @registration_num = registration
  end
end