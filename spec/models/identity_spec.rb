require 'spec_helper'

describe Identity do
  it { should belong_to :user }

  it { should have_valid(:provider).when('facebook') }
  it { should_not have_valid(:provider).when(nil, '') }
  it { should have_valid(:uid).when('2341234') }
  it { should_not have_valid(:uid).when(nil, '') }
end
