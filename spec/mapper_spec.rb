require_relative '../lib/mapper'

describe 'Remote data mapper' do
  context 'when remote data pass for mapping' do
    let(:remote) { CampaignData.remote_campaigns }
    subject { Mapper.mapper(remote) }

    it 'return array of hash' do
      expect(subject).to be_an_instance_of(Array)
    end

    it "includes external_reference key - after mapping" do
      expect(subject.first).to have_key('external_reference')
    end

    it 'return external reference truthy' do
      expect(subject.any? { |hash| hash['external_reference'] == '1' }).to be_truthy
    end

  end
end