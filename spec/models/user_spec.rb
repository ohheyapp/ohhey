require 'spec_helper'

describe User do
  let(:user) { create :user }

  it { should have_many(:received_messages) }
  it { should have_many(:sent_messages) }

  describe '#masked_email' do
    it 'masks the users email address' do
      masked_email = Digest::SHA1.hexdigest(user.email)[0,8]
      expect(user.masked_email).to eq '4d2913d1'
    end
  end
end
