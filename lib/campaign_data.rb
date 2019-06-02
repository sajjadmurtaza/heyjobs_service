require 'json'
require 'net/http'

class CampaignData

  # remote campaigns data and parsed in Array of Hash format
  def self.remote_campaigns
    uri = URI('https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df')
    remote_data = Net::HTTP.get(uri)

    JSON.parse(remote_data).fetch('ads')
  end

  # local data stored in CONSTANT, we can also make a *mockbin but for simplicity i am using constant ads in a form or array of hash and did some changings
  LOCAL_CAMPAIGNS = [
      { "external_reference": "1", "status": "paused", "ad_description": "Description for campaign 11"},
      { "external_reference": "2", "status": "paused", "ad_description": "Description for campaign 12" },
      { "external_reference": "3", "status": "active",  "ad_description": "Something wents wrong" }
  ]

end
