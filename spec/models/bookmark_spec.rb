require 'spec_helper'

describe Bookmark do
  it { should belong_to :author }
  it { should have_valid(:title).when('a title') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:url).when('http://www.google.com') }
  it { should_not have_valid(:url).when('http://', nil, 'ftp://wtf.com') }
end
