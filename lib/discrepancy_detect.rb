require_relative '../lib/heyjob'
require_relative '../lib/campaign_data'
require_relative '../lib/mapper'

class DiscrepancyDetect < Heyjob
  def call
    remote_campaigns = Mapper.mapper(CampaignData.remote_campaigns) # getting remote campaigns data
    local_campaigns  = CampaignData::LOCAL_CAMPAIGNS                # getting local campaigns data

    get_discrepancies(local_campaigns, remote_campaigns)            # calling function to get differences between remote and local
  end

  private

    # get_discrepancies method will return differrences between remote and local
    # skip if there will same values for a key in compaign
    # error if there will no compaign found

    def get_discrepancies(local_campaigns, remote_campaigns)
      status = {"enabled" => "active", "disabled" => "paused", "deleted" => "deleted"}
      differences = []

      local_campaigns.each do |campaign|
        external_reference = campaign[:external_reference]
        remote_campaign = find_remote_campaigns(remote_campaigns, external_reference)

        if remote_campaign

          hsh = {remote_reference: external_reference, discrepancies: {}}

          campaign.each do |k, v|
            next if k.to_s == 'status' && campaign[:status] == status[remote_campaign['status']]
            hsh[:discrepancies][k] = {remote: remote_campaign[k.to_s], local: v} if (remote_campaign[k.to_s] != v)
          end

          next if hsh[:discrepancies].empty?
          differences << hsh
        else
          differences << error_message(external_reference)
        end

      end
      differences
    end

    # method used for to find external capmaign
    def find_remote_campaigns(remote_campaigns, external_reference)
      remote_campaigns.detect { |c| c['external_reference'] == external_reference }
    end

    # error message method
    def error_message(external_reference)
      {
          remote_reference: external_reference,
          error: "Campaign not found!"
      }
    end

end

#
# ********************************************
#          Calling
# ********************************************
#
p DiscrepancyDetect.call