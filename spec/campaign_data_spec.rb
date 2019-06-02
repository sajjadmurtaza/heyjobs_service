require_relative '../lib/campaign_data'

describe 'Campaigns Data' do
  let(:remote) { CampaignData.remote_campaigns }
  let(:local) { CampaignData::LOCAL_CAMPAIGNS }

  it "should have remote campaigns data" do
    expect(remote.length).to eq(3)
  end

  it "should have local campaigns data" do
    expect(local.length).to eq(3)
  end

end