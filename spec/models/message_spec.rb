require 'spec_helper'

describe Message do
  it { should belong_to(:missed_connection) }
  it { should belong_to(:sender) }
  it { should belong_to(:receiver) }
end
