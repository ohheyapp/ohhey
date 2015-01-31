require 'spec_helper'

describe MissedConnection do
  it { should belong_to(:user) }
  it { should have_many(:messages) }
end
