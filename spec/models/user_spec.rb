require 'spec_helper'

describe User do
  it { should have_valid(:email).when('user@example.com') }
  it { should_not have_valid(:email).when('', nil, 'badformat')}

  it { should have_many :bookmarks }
  it { should have_many :identities }
end
