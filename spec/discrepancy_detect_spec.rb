require_relative '../lib/discrepancy_detect'

describe 'Discrepancy Detection' do
    subject { DiscrepancyDetect.call }

    it 'return output as array of hash' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'return discrepancies' do
      expected_result = [
          {:remote_reference=>"1", :discrepancies=>{:status=>{:remote=>"enabled", :local=>"paused"}}},
          {:remote_reference=>"3", :discrepancies=>{:ad_description=>{:remote=>"Description for campaign 13", :local=>"Something wents wrong"}}}
      ]

      expect(subject).to eq(expected_result)
    end
end