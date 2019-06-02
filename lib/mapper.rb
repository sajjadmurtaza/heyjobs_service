class Mapper

  # mapper method use to map the remote keys to local data keys
  # e.g. reference to external_reference
  def self.mapper(remote_campaigns)
    mappings = {"reference" => "external_reference", "status" => "status", "description" => "ad_description"}

    remote_campaigns.map { |campaign| campaign.map {|k, v| [mappings[k], v] }.to_h }
  end

end